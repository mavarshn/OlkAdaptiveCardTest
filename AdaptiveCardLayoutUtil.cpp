#include "stdafx.h"
#include "AdaptiveCardLayoutUtil.h"
#include "AdaptiveLabel.h"

using namespace NetUI;

struct layoutParams
{
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
		pLabel->Layout();
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

	ULONG width = pe->GetExtent().cx;

	if (pparams->totalWidthToFit &&
		pparams->totalWidthAvailable)
	{
		if (width > 0)
		{
			width = width * pparams->totalWidthAvailable / pparams->totalWidthToFit;
		}
	}

	pe->SetWidth(width);
	pe->ForAllDescendentsOfType(L"AdaptiveLabel", UpdateWrap, nullptr);

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

_Callback_ HRESULT NETUI_API UpdateColumnLayout(Element *pe, void *pv)
{
	Assert(pe != nullptr);
	Assert(pe->IsElement());
	if (pe != nullptr && !pe->IsElement())
		return S_FALSE;

	ULONG totalWidth = 0;
	ForAllDescendentsWithId(pe, L"Column", FindTotalWidth, &totalWidth);

	ULONG totalAvailableWidth = *(ULONG*) pv;
	layoutParams params;

	params.totalWidthAvailable = totalAvailableWidth;
	params.totalWidthToFit = totalWidth;

	ForAllDescendentsWithId(pe, L"Column", AdjustWidth, &params);

	return NOERROR;
}


std::wstring GetWStringIdFromAtom(ATOM atomId)
{
	const int MAX_ATOM_LENGTH = 256;
	WCHAR wzBuffer[MAX_ATOM_LENGTH] = L"";
	GetAtomNameW(atomId, wzBuffer, MAX_ATOM_LENGTH);

	if (MsoFEmptyWz(wzBuffer))
	{
		return std::wstring();
	}

	return std::wstring(wzBuffer);
}

