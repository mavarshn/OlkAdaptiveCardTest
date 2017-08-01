#pragma once

#include <nuielement.h>
#include <nuivalue.h>
#include "Column.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveColumn : public Element
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;

	void Populate(const std::shared_ptr<Column>& spColumn);
	void Layout();

private:
	std::shared_ptr<Column> m_spColumn;
};