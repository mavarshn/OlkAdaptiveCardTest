#pragma once

#include <nuielement.h>
#include <nuivalue.h>
#include "BaseCardElement.h"
#include "Container.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveContainer : public Element
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;

	void Load(const std::shared_ptr<BaseCardElement>& spContainer);
	void Layout();

private:
	std::shared_ptr<Container> m_spContainer;
};