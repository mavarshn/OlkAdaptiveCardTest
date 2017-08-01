#include "stdafx.h"
#include "AdaptiveCardLayoutUtil.h"
#include "AdaptiveLabel.h"
#include "AdaptiveColumnSet.h"

using namespace NetUI;

_Callback_ HRESULT NETUI_API FindTotalWidth(Element *pe, void *pv)
{
	Assert(pe != nullptr);
	Assert(pe->IsElement());
	if (pe != nullptr && !pe->IsElement())
		return S_FALSE;

	auto currentWidth = *(ULONG*) pv;
	*(ULONG*) pv = currentWidth + pe->GetExtent().cx;

	return NOERROR;
}

HRESULT ForAllChildrenOfType(Element* pRoot, LPCWSTR wzClassName, ElementIterator pfnElement, void *pv)
{
	if (pRoot == nullptr || MsoFEmptyWz(wzClassName))
	{
		return S_FALSE;
	}

	const IClassInfo *pci = Node::LookupClassInfo(wzClassName);
	AssertSz(pci != nullptr, "Could not find class info for given class name.");

	if (pci == nullptr)
	{
		return S_FALSE;
	}

	TreeIterator iter(pRoot);

	for (Element* peChild = iter.FirstElement(); peChild != nullptr; peChild = iter.NextElement(peChild))
	{
		AssertSz(peChild != nullptr, "Given child node is null.");
		AssertSz(peChild->IsElement(), "Given child node is not an element.");
		if (peChild != nullptr && !peChild->IsElement())
		{
			return S_FALSE;
		}

		// if child is of given type; call the callback
		if (peChild->GetIClassInfo()->IsSubclassOf(pci))
		{
			(void)pfnElement(peChild, pv);
		}
	}

	return NOERROR;
}

HRESULT LayoutAdaptiveColumnSets(Element* pRoot, ULONG ulWidth)
{
	if (pRoot == nullptr)
	{
		return S_FALSE;
	}

	const IClassInfo *pci = Node::LookupClassInfo(L"AdaptiveColumnSet");
	AssertSz(pci != nullptr, "Could not find class info for given class name.");

	if (pci == nullptr)
	{
		return S_FALSE;
	}

	TreeIterator iter(pRoot);

	for (Element* peChild = iter.FirstElement(); peChild != nullptr; peChild = iter.NextElement(peChild))
	{
		AssertSz(peChild != nullptr, "Given child node is null.");
		AssertSz(peChild->IsElement(), "Given child node is not an element.");
		if (peChild != nullptr && !peChild->IsElement())
		{
			return S_FALSE;
		}

		// if child is AdaptiveColumnSet type, layout
		// else try finding columns set in subtree rooted at peChild
		if (peChild->GetIClassInfo()->IsSubclassOf(pci))
		{
			AdaptiveColumnSet* pAdaptiveColumnSet = (AdaptiveColumnSet*) peChild;
			pAdaptiveColumnSet->Layout(ulWidth);
		}
		else
		{
			LayoutAdaptiveColumnSets(peChild, ulWidth);
		}
	}

	return NOERROR;
}