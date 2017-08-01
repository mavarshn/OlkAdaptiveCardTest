#include "stdafx.h"
#include "AdaptiveColumn.h"
#include "AdaptiveLabel.h"
#include "AdaptiveColumnSet.h"
#include "AdaptiveCardLayoutUtil.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveColumn::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveColumn, ppElement);
}

void AdaptiveColumn::Populate(const std::shared_ptr<Column>& spColumn)
{
	m_spColumn = spColumn;

	this->SetLayout(DLT_Vert);
	this->SetChildrenMargin(10);
	this->SetBorderThickness(1, 1, 1, 1);

	for (auto & spItem : spColumn->GetItems())
	{
		if (spItem->GetElementType() == CardElementType::TextBlock)
		{
			Element* pe;
			AdaptiveLabel* pl;
			AdaptiveLabel::Create(&pe);
			pl = (AdaptiveLabel*) pe;

			this->AddElement(pl);
			pl->Populate(std::static_pointer_cast<TextBlock> (spItem));
		}

		if (spItem->GetElementType() == CardElementType::ColumnSet)
		{
			Element* pe;
			AdaptiveColumnSet* pcs;
			AdaptiveColumnSet::Create(&pe);
			pcs = (AdaptiveColumnSet*) pe;

			this->AddElement(pcs);
			pcs->Populate(std::static_pointer_cast<ColumnSet>(spItem));
		}
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