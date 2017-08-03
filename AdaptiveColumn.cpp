#include "stdafx.h"
#include "AdaptiveColumn.h"
#include "AdaptiveCardLayoutUtil.h"
#include "AdaptiveCardNetUIRenderer.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveColumn::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveColumn, ppElement);
}

void AdaptiveColumn::Load(const std::shared_ptr<BaseCardElement>& spColumn)
{
	m_spColumn = std::static_pointer_cast<Column>(spColumn);

	this->SetLayout(DLT_Vert);
	this->SetChildrenMargin(10);
	this->SetBorderThickness(1, 1, 1, 1);

	for (auto & spItem : m_spColumn->GetItems())
	{
		Element* pe;
		AdaptiveCardNetUIRenderer::HrCreateAdaptiveElement(spItem, &pe);
		this->AddElement(pe);
	}
}

void AdaptiveColumn::Layout(ULONG ulWidth)
{
	this->SetWidth(ulWidth);

	// look for other columnsets inside this column to layout
	LayoutAdaptiveColumnSets(this, ulWidth);
}

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(AdaptiveColumn, Element, L"AdaptiveColumn", NUICloneSupported);