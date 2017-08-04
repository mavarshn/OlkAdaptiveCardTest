#include "stdafx.h"
#include "AdaptiveContainer.h"
#include "AdaptiveCardNetUIRenderer.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveContainer::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveContainer, ppElement);
}

void AdaptiveContainer::Load(const std::shared_ptr<BaseCardElement>& spContainer)
{
	m_spContainer = std::static_pointer_cast<Container>(spContainer);

	this->SetLayout(DLT_Vert);
	this->SetBorderThickness(1, 1, 1, 1);
	this->SetExpandToFillVert(false);

	for (auto & spItem : m_spContainer->GetItems())
	{
		Element* pe;
		AdaptiveCardNetUIRenderer::HrCreateAdaptiveElement(spItem, &pe);
		this->AddElement(pe);
	}
}

void AdaptiveContainer::Layout()
{
}

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(AdaptiveContainer, Element, L"AdaptiveContainer", NUICloneSupported);