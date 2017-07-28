#include "stdafx.h"
#include "AdaptiveCardNetUIRenderer.h"
#include <codecvt>

AdaptiveCardNetUIRenderer::AdaptiveCardNetUIRenderer()
{
}


AdaptiveCardNetUIRenderer::~AdaptiveCardNetUIRenderer()
{
}

HRESULT AdaptiveCardNetUIRenderer::BuildTextBlock(const AdaptiveCards::TextBlock textBlock, NetUI::Element ** label)
{
	HRESULT hr = NetUI::Label::Create(label);
	if (FAILED(hr))
		return hr;

	return (*label)->SetContentString(textBlock.GetText().c_str());
}
