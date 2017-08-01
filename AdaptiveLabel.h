#pragma once

#include <nuielement.h>
#include <nuivalue.h>
#include "TextBlock.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveLabel: public Label
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;

	void Populate(const std::shared_ptr<TextBlock>& spTextBlock);
	void Layout();

private:
	std::shared_ptr<TextBlock> m_spTextBlock;
};

