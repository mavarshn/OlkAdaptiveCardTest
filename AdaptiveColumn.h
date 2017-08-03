#pragma once

#include <nuielement.h>
#include <nuivalue.h>
#include "BaseCardElement.h"
#include "Column.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveColumn : public Element
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;

	void Load(const std::shared_ptr<BaseCardElement>& spColumn);
	void Layout(ULONG ulWidth);

private:
	std::shared_ptr<Column> m_spColumn;
};