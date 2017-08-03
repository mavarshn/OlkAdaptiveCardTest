#pragma once

#include <nuielement.h>
#include <nuivalue.h>
#include "BaseCardElement.h"
#include "TextBlock.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveLabel: public Label
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;

	void Load(const std::shared_ptr<BaseCardElement>& spTextBlock);

	void Layout();

private:
	std::shared_ptr<TextBlock> m_spTextBlock;
};

