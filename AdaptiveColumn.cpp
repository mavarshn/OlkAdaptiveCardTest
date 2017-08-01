#include "stdafx.h"
#include "AdaptiveColumn.h"
#include "AdaptiveLabel.h"

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

	for (auto & spItem : spColumn->GetItems())
	{
		if (!(spItem->GetElementType() == CardElementType::TextBlock))
		{
			continue;
		}

		Element* pe;
		AdaptiveLabel* pc;
		AdaptiveLabel::Create(&pe);
		pc = (AdaptiveLabel*) pe;

		this->AddElement(pc);
		pc->Populate(std::static_pointer_cast<TextBlock> (spItem));
	}
}

void AdaptiveColumn::Layout()
{

}

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(AdaptiveColumn, Element, L"AdaptiveColumn", NUICloneSupported);