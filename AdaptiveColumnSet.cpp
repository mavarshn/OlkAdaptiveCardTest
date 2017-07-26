
#include "stdafx.h"

#include "AdaptiveColumnSet.h"
#include "AdaptiveLabel.h"

using namespace NetUI;

struct layoutParams
{
	bool adjustWidth;
	ULONG totalWidthAvailable;
	ULONG totalWidthToFit;
};

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

_Callback_ HRESULT NETUI_API UpdateWrap(Element *pe, void*)
{
	Assert(pe != nullptr);
	Assert(pe->IsElement());
	if (pe != nullptr && !pe->IsElement())
		return S_FALSE;

	AdaptiveLabel* pLabel = nui_control_cast<AdaptiveLabel>(pe);

	if (pLabel)
	{
		bool wrapbool = pLabel->GetWrapText();
		if (wrapbool)
		{
			pLabel->SetTextAlign(CA_WrapLeft | CA_EndEllipsis);
		}
		else
		{
			pLabel->SetTextAlign(CA_Left | CA_EndEllipsis);
		}
	}

	return NOERROR;
}

_Callback_ HRESULT NETUI_API AdjustWidth(Element *pe, void *pv)
{
	Assert(pe != nullptr);
	Assert(pe->IsElement());
	if (pe != nullptr && !pe->IsElement())
		return S_FALSE;

	layoutParams* pparams = (layoutParams*) pv;

	if (pparams->adjustWidth && pparams->totalWidthToFit > 0 && pparams->totalWidthAvailable)
	{
		ULONG width = pe->GetExtent().cx;

		if (width > 0)
		{
			ULONG targetWidth = width * pparams->totalWidthAvailable / pparams->totalWidthToFit;

			pe->SetWidth(targetWidth);
		}
	}

	pe->ForAllDescendentsOfType(L"Label", UpdateWrap, nullptr);

	return NOERROR;
}


HRESULT ForAllDescendentsWithAtomId(Element* pRoot, ATOM atomID, ElementIterator pfnElement, void *pv)
{
	HRESULT hr;

	
	if (pRoot == nullptr || atomID == 0)
	{
		return S_FALSE;
	}

	// Check this Element
	if (pRoot->GetID() == atomID)
	{
		hr = pfnElement(pRoot, pv);
		if (FAILED(hr))
			return hr;
	}
	else
		hr = S_FALSE;

	TreeIterator iter(pRoot);

	for (Element* peChild = iter.FirstElement(); peChild != NULL; peChild = iter.NextElement(peChild))
	{
		HRESULT hrChild = ForAllDescendentsWithAtomId(peChild, atomID, pfnElement, pv);

		if (hrChild != S_FALSE)
			hr = hrChild;

		if (FAILED(hrChild))
			break;
	}

	return hr;
}

HRESULT ForAllDescendentsWithId(Element* pRoot, LPCWSTR wzClassName, ElementIterator pfnElement, void *pv)
{
	if (pRoot == nullptr || MsoFEmptyWz(wzClassName))
	{
		return S_FALSE;
	}

	return ForAllDescendentsWithAtomId(pRoot, GetSearchAtom(wzClassName), pfnElement, pv);
}

void AdaptiveColumnSet::AddColumnSet(Element* pRootElement)
{
	if (pRootElement)
	{
		Element* pe;
		Element::Create(EC_Normal, &pe);
		pe->SetLayout(DLT_Table);
		pe->SetID(L"columnSet");
		pe->SetChildrenMargin(10);
		pe->SetColumns(3);
		pRootElement->AddElement(pe);

		AddColumn(pe, L"Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large", true);
		AddColumn(pe, L"Small Small");
		AddColumn(pe, L"Medium Medium Medium Medium Medium Medium Medium Medium");
	}
}

void AdaptiveColumnSet::AddColumn(Element* pColumnSet, const std::wstring &label, bool setWrap)
{
	if (pColumnSet)
	{
		Element* pe;
		Element::Create(EC_Normal, &pe);
		pe->SetLayout(DLT_Vert);
		pe->SetID(L"column");
		pColumnSet->AddElement(pe);
		AddLabels(pe, label, setWrap);
	}
}

void AdaptiveColumnSet::AddLabels(Element* pColumn, const std::wstring &label, bool setWrap)
{
	if (pColumn)
	{
		for (int i = 0; i < 3; i++)
		{
			Element* pe;
			AdaptiveLabel* pl;

			AdaptiveLabel::Create(&pe);
			pl = (AdaptiveLabel*)pe;
			pl->SetTextAlign(CA_Left);
			pl->SetWrapText(setWrap);
			pl->SetExpandToFillHoriz(true);
			pl->SetTextString(label.c_str());
			pColumn->AddElement(pl);
		}
	}
}

void AdaptiveColumnSet::LayoutColumnSet(Element* pRootElement)
{
	if (pRootElement)
	{
		Element* pColumnSet = pRootElement->FindDescendentByID(L"columnSet");

		if (pColumnSet)
		{
			ULONG totalWidth = 0;
			ForAllDescendentsWithId(pColumnSet, L"Column", FindTotalWidth, &totalWidth);

			ULONG totalAvailableWidth = pRootElement->GetExtent().cx;
			layoutParams params;

			params.adjustWidth = totalWidth > totalAvailableWidth;
			params.totalWidthAvailable = totalAvailableWidth;
			params.totalWidthToFit = totalWidth;

			ForAllDescendentsWithId(pColumnSet, L"Column", AdjustWidth, &params);
		}
	}
}
