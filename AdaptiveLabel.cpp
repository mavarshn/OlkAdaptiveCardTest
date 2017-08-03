
#include "stdafx.h"
#include "AdaptiveLabel.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveLabel::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveLabel, ppElement);
}

void AdaptiveLabel::Load(const std::shared_ptr<BaseCardElement>& spTextBlock)
{
	m_spTextBlock = std::static_pointer_cast<TextBlock>(spTextBlock);

	this->SetTextAlign(CA_Left);
	this->SetExpandToFillHoriz(true);
	this->SetExpandToFillVert(false);
	this->SetTextString(m_spTextBlock->GetText().c_str());
}

void AdaptiveLabel::Layout()
{
	if (m_spTextBlock->GetWrap())
	{
		SetTextAlign(CA_WrapLeft | CA_EndEllipsis);
	}
	else
	{
		SetTextAlign(CA_Left | CA_EndEllipsis);
	}
}

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(AdaptiveLabel, Label, L"AdaptiveLabel", NUICloneSupported);