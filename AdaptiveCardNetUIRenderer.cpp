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

	std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> converter;
	std::wstring wide = converter.from_bytes(textBlock.GetText());

	return (*label)->SetContentString(wide.c_str());
}
