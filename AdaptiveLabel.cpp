
#include "stdafx.h"
#include "AdaptiveLabel.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveLabel::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveLabel, ppElement);
}

void AdaptiveLabel::Populate(const std::shared_ptr<TextBlock>& spTextBlock)
{
	m_spTextBlock = spTextBlock;

	this->SetTextAlign(CA_Left);
	this->SetExpandToFillHoriz(true);
	this->SetTextString(spTextBlock->GetText().c_str());
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