#pragma once

#include <nuielement.h>
#include <nuivalue.h>
#include "BaseCardElement.h"
#include "FactSet.h"
#include "Fact.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveFactSet : public Element
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;

	void Load(const std::shared_ptr<BaseCardElement>& spFactSet);

	void Layout();

private:
	void CreateFact(Element** pe, const std::shared_ptr<Fact>& spFact);
	void CreateFactTitleAndValue(Element* pe, const std::shared_ptr<Fact>& spFact);
	void CreateFactTitle(Label** ppLabel, const std::wstring& wstrFactTitle);
	void CreateFactValue(Label** ppLabel, const std::wstring& wstrFactValue);
	std::shared_ptr<FactSet> m_spFactSet;
};