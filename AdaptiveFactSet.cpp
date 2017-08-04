
#include "stdafx.h"
#include "AdaptiveFactSet.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveFactSet::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveFactSet, ppElement);
}

void AdaptiveFactSet::Load(const std::shared_ptr<BaseCardElement>& spFactSet)
{
	m_spFactSet = std::static_pointer_cast<FactSet>(spFactSet);

	this->SetExpandToFillHoriz(false);
	this->SetExpandToFillVert(false);
	this->SetLayout(DLT_Vert);

	for (auto & spFact : m_spFactSet->GetFacts())
	{
		Element* pe;
		CreateFact(&pe, spFact);
		this->AddElement(pe);
	}

}

void AdaptiveFactSet::CreateFact(Element** ppe, const std::shared_ptr<Fact>& spFact)
{
	Element::Create(EC_Normal, ppe);

	(*ppe)->SetExpandToFillHoriz(false);
	(*ppe)->SetExpandToFillVert(false);
	(*ppe)->SetLayout(DLT_Horiz);

	CreateFactTitleAndValue(*ppe, spFact);
}

void AdaptiveFactSet::CreateFactTitleAndValue(Element* pe, const std::shared_ptr<Fact>& spFact)
{
	Label* pTitle;
	CreateFactTitle(&pTitle, spFact->GetTitle());
	pe->AddElement(pTitle);

	Label* pValue;
	CreateFactValue(&pValue, spFact->GetValue());
	pe->AddElement(pValue);
}

void AdaptiveFactSet::CreateFactTitle(Label** ppLabel, const std::wstring& wstrFactTitle)
{
	Element* pe;
	Label::Create(&pe);

	*ppLabel = (Label*) pe;
	(*ppLabel)->SetTextString(wstrFactTitle.c_str());
	(*ppLabel)->SetTextAlign(CA_Left);
	(*ppLabel)->SetExpandToFillHoriz(true);
	(*ppLabel)->SetExpandToFillVert(false);
	(*ppLabel)->SetWidth(275);
	(*ppLabel)->SetTextAlign(CA_WrapLeft | CA_EndEllipsis);
}

void AdaptiveFactSet::CreateFactValue(Label** ppLabel, const std::wstring& wstrFactValue)
{
	Element* pe;
	Label::Create(&pe);

	*ppLabel = (Label*) pe;
	(*ppLabel)->SetTextString(wstrFactValue.c_str());
	(*ppLabel)->SetTextAlign(CA_Left);
	(*ppLabel)->SetExpandToFillHoriz(true);
	(*ppLabel)->SetExpandToFillVert(false);
	(*ppLabel)->SetWidth(275);
	(*ppLabel)->SetTextAlign(CA_WrapLeft | CA_EndEllipsis);
}

void AdaptiveFactSet::Layout()
{

}

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(AdaptiveFactSet, Label, L"AdaptiveFactSet", NUICloneSupported);