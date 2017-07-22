<!-- example package -->
<FlexUI>

	<!-- the ui goes under a flexml tag -->
	<FlexML>
		<NetUIXML>

			<DialogView DataSourceType="Root">
				<Gallery Class="DataSourced"
					DataSource="*Bind(Property=ViewerGalleryRootDS)"
					>
				</Gallery>

				<EnterString Label="SelectedValue:" Value="*Bind(Property=ViewerGalleryRootDS.SelectedValue)" />
				<EnterString Label="HighlightedValue:" Value="*Bind(Property=ViewerGalleryRootDS.HighlightedValue)" />
			</DialogView>
		</NetUIXML>
	</FlexML>

	<!-- here are our definitions of datasources -->
	<DataSource ID="Root">
		<Property ID="ViewerGalleryRootDS" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDS">
		<Property ID="Tcid"             Type="Int32"/>

		<Property ID="Label"            Type="String" />
		<Property ID="SelectedValue"    Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem"     Type="DataSource" />
		<Property ID="HighlightedItem"  Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />

		<Property ID="ImageSource"      Type="Image" />
		<Property ID="Tooltip"          Type="String"/>
		<Property ID="Anchor"           Type="Int32" />
		<Property ID="Layout"           Type="Int32" />
		<Property ID="FilterIndex"      Type="Int32" />
		<Property ID="InRibbonItemsHeight" Type="Int32" />
		<Property ID="ItemsHeight"      Type="Int32" />
		<Property ID="ItemsWidth"       Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>

		<Property ID="Categories"  Type="List" />
		<Property ID="Items"       Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Menus"       Type="List" />
		<Property ID="Commands"    Type="List" />

		<Property ID="IsFilterVisible"     Type="Boolean" />
		<Property ID="IsBitFiltering"      Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />
		<Property ID="IsDropFullWidthEnabled" Type="Boolean" />

		<Property ID="EventingItem"  Type="DataSource" />
		<Event ID="ItemContextMenuDroppingCommand" />
		<Event ID="ItemContextMenuClosingCommand" />
		<Event ID="ItemLivePreviewStartCommand" />
		<Event ID="ItemLivePreviewStopCommand" />
	</DataSource>

	<DataSource ID="GalleryCategory">
		<Property ID="Label" Type="String"/>
		<Property ID="Items" Type="List"/>
	</DataSource>

	<DataSource ID="GalleryItem">
		<Property ID="Label" Type="String" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="TextPosition" Type="Int32" />
		<Property ID="TextPercentImage" Type="Int32" />
		<Property ID="GroupID" Type="Int32" />
		<Property ID="MenuSrcId" Type="Atom" />
		<Property ID="pvClient" Type="UInt32" />
		<Property ID="LargeImageSource" Type="Image" />
		<Property ID="ImageWidth" Type="Int32" />
		<Property ID="ImageHeight" Type="Int32" />
		<Property ID="LargePreviewPercentImage" Type="Int32" />
		<Property ID="RTFLabel" Type="String" />
		<Property ID="SelectionValue" Type="String" />
		<Property ID="ContextMenuFlexMLContentID" Type="Int32" />
		<Property ID="ContextMenuDataSource" Type="DataSource" />
	</DataSource>

	<DataSource ID="FilterItem">
		<Property ID="Label" Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="FilterType" Type="Int32" />
		<Property ID="FilterMask" Type="Int32" />
		<Property ID="pvClient" Type="UInt32" />
	</DataSource>

	<!-- here are our data for the datasources -->
	<Root>
	<ViewerGalleryRootDS>
		<Label>Gallery Label</Label>

		<Anchor>5</Anchor>  <!-- 5: combobox, 4:dropdown -->
		<Layout>1</Layout>

		<IsAutoCompleteEnabled>true</IsAutoCompleteEnabled>
		<IsDropFullWidthEnabled>false</IsDropFullWidthEnabled>
		<IsFilterVisible>true</IsFilterVisible>
		<SelectedString>Later</SelectedString>
		<ItemsWidth>200</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>

		<Items>
			<GalleryItem>
				<SelectionValue>0</SelectionValue>
				<Label>Always</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<SelectionValue>1</SelectionValue>
				<Label>Later</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<SelectionValue>2</SelectionValue>
				<Label>Never</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
			</GalleryItem>

			<GalleryItem>
				<SelectionValue>3</SelectionValue>
				<Label>Never Again</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
			</GalleryItem>

			<GalleryItem>
				<SelectionValue>4</SelectionValue>
				<Label>Now and thenNow and thenNow and thenNow and thenNow and then</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<SelectionValue>5</SelectionValue>
				<Label>Occasionally</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<SelectionValue>6</SelectionValue>
				<Label>Once in a while</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<SelectionValue>7</SelectionValue>
				<Label>Sometimes</Label>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>"sizeToNeighbors"</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
			</GalleryItem>
		</Items>

		<FilterItems>
			<FilterItem>
				<Label>All</Label>
				<FilterMask>65535</FilterMask>
			</FilterItem>
			<FilterItem>
				<Label>Odd</Label>
				<FilterMask>1</FilterMask>
			</FilterItem>
			<FilterItem>
				<Label>Even</Label>
				<FilterMask>2</FilterMask>
			</FilterItem>
		</FilterItems>

	</ViewerGalleryRootDS>

	</Root>

</FlexUI>
