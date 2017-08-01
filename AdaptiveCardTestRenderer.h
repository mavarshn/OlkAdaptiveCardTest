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
	void Layout();
private:
	NetUI::Element* m_pRootElement;
	AdaptiveCardElementListener* m_pAdaptiveCardElementListener;
};

