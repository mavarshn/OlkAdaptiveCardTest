#include "stdafx.h"

#include "AdaptiveCardTestRenderer.h"
#include "AdaptiveLabel.h"
#include "AdaptiveCardLayoutUtil.h"
#include "SharedAdaptiveCard.h"
#include "ColumnSet.h"
#include "AdaptiveColumnSet.h"

using namespace AdaptiveCards;
using namespace NetUI;

void AdaptiveCardTestRenderer::AddColumnSet()
{
	if (m_pRootElement)
	{
		std::shared_ptr<AdaptiveCard> sharedAdaptiveCard = AdaptiveCard::DeserializeFromFile(L"AdaptiveCard.json");

		for (auto & spElement : sharedAdaptiveCard->GetBody())
		{
			if (spElement->GetElementType() == CardElementType::ColumnSet)
			{
				Element* pe;
				AdaptiveColumnSet* pc;
				AdaptiveColumnSet::Create(&pe);
				pc = (AdaptiveColumnSet*) pe;

				m_pRootElement->AddElement(pc);
				pc->Populate(std::static_pointer_cast<ColumnSet>(spElement));
			}
		}
		/*Element* pe;
		Element::Create(EC_Normal, &pe);
		pe->SetLayout(DLT_Table);
		pe->SetID(L"columnSet");
		pe->SetChildrenMargin(10);
		pe->SetColumns(3);
		m_pRootElement->AddElement(pe);

		AddColumn(pe, L"Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large", L"Column1", true);
		AddColumn(pe, L"Small Small", L"Column2");
		AddColumn(pe, L"Medium Medium Medium Medium Medium Medium Medium Medium", L"Column3");*/
	}
}

void AdaptiveCardTestRenderer::AddColumn(Element* pColumnSet, const std::wstring &label, const std::wstring &id,  bool setWrap)
{
	if (pColumnSet)
	{
		Element* pe;
		Element::Create(EC_Normal, &pe);
		pe->SetLayout(DLT_Vert);
		pe->SetID(id.c_str());
		pColumnSet->AddElement(pe);
		AddLabels(pe, label, setWrap);
	}
}

void AdaptiveCardTestRenderer::AddLabels(Element* pColumn, const std::wstring &label, bool /*setWrap*/)
{
	if (pColumn)
	{
		std::wstring wstrColumnId = GetWStringIdFromAtom(pColumn->GetID());

		for (int i = 0; i < 3; i++)
		{
			Element* pe;
			AdaptiveLabel* pl;

			AdaptiveLabel::Create(&pe);
			pl = (AdaptiveLabel*) pe;
			pl->SetTextAlign(CA_Left);
			//pl->SetWrapText(setWrap);
			pl->SetExpandToFillHoriz(true);
			pl->SetTextString(label.c_str());
			pl->SetID((wstrColumnId + L"Label" + std::to_wstring(i)).c_str());
			pColumn->AddElement(pl);
		}
	}
}

void AdaptiveCardTestRenderer::LayoutColumnSet()
{
	//if (m_pRootElement)
	//{
	//	AutoDeferBlock adb;
	//	ULONG availableWidth = m_pRootElement->GetExtent().cx;
	//	ForAllDescendentsWithId(m_pRootElement, L"columnSet", UpdateColumnLayout, &availableWidth);
	//}
}

AdaptiveCardTestRenderer::AdaptiveCardTestRenderer(Element* pRootElement) : m_pRootElement(pRootElement)
{
	if (pRootElement)
	{
		// TODO : remove capturing "this", instead capture weak_ptr
		m_pAdaptiveCardElementListener = new AdaptiveCardElementListener([this]()
		{
			LayoutColumnSet();
		});
		pRootElement->AddListener(m_pAdaptiveCardElementListener);
	}
}

AdaptiveCardTestRenderer::~AdaptiveCardTestRenderer()
{
	if (m_pRootElement && m_pAdaptiveCardElementListener)
	{
		m_pRootElement->RemoveListener(m_pAdaptiveCardElementListener);
	}
}

void AdaptiveCardTestRenderer::TestTreeTraversal()
{
	if (m_pRootElement)
	{
		NUITrace("\n\n -----------testing tree traversal strategy 1 --------- \n");
		TreeTraversalStrategy1(m_pRootElement);
		NUITrace("\n\n -----------testing tree traversal strategy 2 --------- \n");
		TreeTraversalStrategy2(m_pRootElement);
	}
}

void AdaptiveCardTestRenderer::TreeTraversalStrategy1(Element* pRootElement)
{
	TreeIterator iter(pRootElement);

	// visit root element
	std::wstring wstrElementID = GetWStringIdFromAtom(pRootElement->GetID());
	NUITrace(("vising element id ---> " + std::string(wstrElementID.begin(), wstrElementID.end()) + "\n").c_str());

	for(pRootElement = iter.FirstElement(); pRootElement != nullptr; pRootElement = iter.NextElement(pRootElement))
	{
		TreeTraversalStrategy1(pRootElement);
	}
}

void AdaptiveCardTestRenderer::TreeTraversalStrategy2(Element* pRootElement)
{
	TreeIterator iter(pRootElement);

	pRootElement = iter.FirstElement();

	while (pRootElement != nullptr)
	{
		// visit root element
		std::wstring wstrElementID = GetWStringIdFromAtom(pRootElement->GetID());
		NUITrace(("vising element id ---> " + std::string(wstrElementID.begin(), wstrElementID.end()) + "\n").c_str());

		pRootElement = iter.NextSubTreeElement(pRootElement);
	}
}