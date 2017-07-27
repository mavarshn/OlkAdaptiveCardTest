#pragma once
#include <iostream>
#include <nuielement.h>
#include "AdaptiveCardElementListener.h"

// TODO: Wrap include for memory header inside stlpre and stlpost block
#include <memory>


class AdaptiveCardTestRenderer
{
public:
	AdaptiveCardTestRenderer(NetUI::Element* pRootElement);
	~AdaptiveCardTestRenderer();
	void AddColumnSet();
	void AddColumn(NetUI::Element* pColumnSet, const std::wstring &label, bool setWrap = false);
	void LayoutColumnSet();
	void AddLabels(NetUI::Element* pColumn, const std::wstring &label, bool setWrap = false);
private:
	NetUI::Element* m_pRootElement;
	AdaptiveCardElementListener* m_pAdaptiveCardElementListener;
};

