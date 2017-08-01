#include "stdafx.h"
#include "AdaptiveColumnSet.h"
#include "AdaptiveColumn.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveColumnSet::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveColumnSet, ppElement);
}

void AdaptiveColumnSet::Populate(const std::shared_ptr<ColumnSet>& spColumnSet)
{
	m_spColumnSet = spColumnSet;

	this->SetLayout(DLT_Horiz);
	this->SetChildrenMargin(10);

	for (auto & spColumn : spColumnSet->GetColumns())
	{
		Element* pe;
		AdaptiveColumn* pc;
		AdaptiveColumn::Create(&pe);
		pc = (AdaptiveColumn*) pe;

		this->AddElement(pc);
		pc->Populate(spColumn);
	}
}

void AdaptiveColumnSet::Layout()
{

}

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(AdaptiveColumnSet, Element, L"AdaptiveColumnSet", NUICloneSupported);