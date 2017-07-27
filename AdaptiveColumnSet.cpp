#include "stdafx.h"
#include "AdaptiveColumnSet.h"

using namespace NetUI;
DEFINE_DEFAULT_VALUES;  // ValueStatics

HRESULT AdaptiveColumnSet::Create(OUT Element** ppElement)
{
	CommonElementCreate(AdaptiveColumnSet, ppElement);
}


////////////////////////////////////////////////////////
// Property definitions
////////////////////////////////////////////////////////
IMPLEMENT_NETUI_PROPERTY_EX(AdaptiveColumnSet,
	StartLayout,
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
	AdaptiveColumnSet::StartLayoutProp
};

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO(AdaptiveColumnSet, Element, L"AdaptiveColumnSet", _aPI, NUIARRAYSIZE(_aPI), NUICloneSupported);