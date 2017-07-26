
#include "stdafx.h"
#include "AdaptiveLabel.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveLabel::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveLabel, ppElement);
}

////////////////////////////////////////////////////////
// Property definitions
////////////////////////////////////////////////////////
IMPLEMENT_NETUI_PROPERTY_EX(AdaptiveLabel,
	WrapText,
	PF_Normal,
	PG_None,
	ValueStatics::vvBool,
	nullptr,
	&ValueStatics::svBoolFalse);

// Class properties
// NOTE:  This array must be sorted in case-insensitive alphabetical order by
// property name as stored in PropertyInfo::szName!!
const PropertyInfo* const _aPI[] =
{
	AdaptiveLabel::WrapTextProp
};

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO(AdaptiveLabel, Label, L"AdaptiveLabel", _aPI, NUIARRAYSIZE(_aPI), NUICloneSupported);