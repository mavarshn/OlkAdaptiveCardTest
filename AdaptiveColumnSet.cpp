#include "stdafx.h"
#include "AdaptiveColumnSet.h"
#include "AdaptiveColumn.h"
#include "AdaptiveCardLayoutUtil.h"
#include "AdaptiveCardNetUIRenderer.h"

using namespace NetUI;
using namespace AdaptiveCards;
DEFINE_DEFAULT_VALUES;  // ValueStatics

struct layoutParams
{
	ULONG totalWidthAvailable;
	ULONG totalWidthToFit;
};

_Callback_ HRESULT NETUI_API LayoutColumn(Element *pe, void *pv)
{
	Assert(pe != nullptr);
	Assert(pe->IsElement());
	if (pe != nullptr && !pe->IsElement())
		return S_FALSE;

	AdaptiveColumn* pColumn = (AdaptiveColumn*) pe;
	layoutParams* pparams = (layoutParams*) pv;

	ULONG width = pColumn->GetExtent().cx;

	if (pparams->totalWidthToFit &&
		pparams->totalWidthAvailable)
	{
		if (width > 0)
		{
			width = width * pparams->totalWidthAvailable / pparams->totalWidthToFit;
		}
	}

	pColumn->Layout(width);

	return NOERROR;
}

HRESULT AdaptiveColumnSet::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveColumnSet, ppElement);
}

void AdaptiveColumnSet::Load(const std::shared_ptr<BaseCardElement>& spColumnSet)
{
	m_spColumnSet = std::static_pointer_cast<ColumnSet>(spColumnSet);;

	this->SetLayout(DLT_Horiz);
	this->SetExpandToFillVert(false);
	this->SetBorderThickness(1,1,1,1);

	for (auto & spColumn : m_spColumnSet->GetColumns())
	{
		Element* pe;
		AdaptiveCardNetUIRenderer::HrCreateAdaptiveElement(spColumn, &pe);
		this->AddElement(pe);
	}
}

void AdaptiveColumnSet::Layout(ULONG ulWidth)
{
	// find current width by adding up all columns width
	ULONG totalWidth = 0;
	ForAllChildrenOfType(this, L"AdaptiveColumn", FindTotalWidth, &totalWidth);

	layoutParams params;
	params.totalWidthAvailable = ulWidth;
	params.totalWidthToFit = totalWidth;

	// layout all the columns
	ForAllChildrenOfType(this, L"AdaptiveColumn", LayoutColumn, &params);
}

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(AdaptiveColumnSet, Element, L"AdaptiveColumnSet", NUICloneSupported);