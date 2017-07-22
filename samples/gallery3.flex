<!-- example package -->
<FlexUI>
	
	<!-- the ui goes under a flexml tag -->
	<FlexML>
		<DialogView DataSourceType="Root">
<!--
		<Category Label="Data Sourced Gallery">
			<Gallery ID="gallds" Class="DataSourced"
				DataSource="*Bind(Property=ViewerGalleryRootDS)"
				>
			</Gallery>
		</Category>

		<Category Label="Gallery with Categories">
			<Gallery ID="gallcat" Class="DataSourced" DataSource="*Bind(Property=GalleryCategoryDS)" />
		</Category>
-->
		<Category Label="Grid Gallery, 10 items">
			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButtonStandard"
				Layout="Grid" 
				Label="Grid" 
				Items="*Bind(Property=ViewerGalleryRootDSTen.Items)"
				ItemsHeight="-2"
				ItemsWidth="-2"
				ResizeType="Corner"
				/>
		</Category>

		<Category Label="Grid Gallery, 20 items">
			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButtonStandard"
				Layout="Grid" 
				Label="Grid" 
				Items="*Bind(Property=ViewerGalleryRootDSTwenty.Items)"
				ItemsHeight="-2"
				ItemsWidth="-2"
				/>
		</Category>

		<Category Label="Grid Gallery, 60 items">
			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButtonStandard"
				Layout="Grid" 
				Label="Grid" 
				Items="*Bind(Property=ViewerGalleryRootDSSixty.Items)"
				ItemsHeight="-2"
				ItemsWidth="-2"
				/>
		</Category>

		<Category Label="Grid Gallery, 120 items">
			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButtonStandard"
				Layout="Grid" 
				Label="Grid" 
				Items="*Bind(Property=ViewerGalleryRootDSOneTwenty.Items)"
				ItemsHeight="-2"
				ItemsWidth="-2"
				/>
		</Category>

		<Category Label="Grid Gallery, 240 items">
			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButtonStandard"
				Layout="Grid" 
				Label="Grid" 
				Items="*Bind(Property=ViewerGalleryRootDSTwoFourty.Items)"
				ItemsHeight="-2"
				ItemsWidth="-2"
				/>
		</Category>

		<Category Label="Grid Gallery with Categories, 2, 2, 6 items">
			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButtonStandard"
				Layout="Grid" 
				Label="Grid" 
				Categories="*Bind(Property=GalleryCategoryDS.Categories)"
				ItemsHeight="-2"
				ItemsWidth="-2"
				/>
		</Category>

		<Category Label="Grid Gallery with huge items">
			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButtonStandard"
				Layout="Grid" 
				Label="Grid" 
				Items="*Bind(Property=GalleryHugeDS.Items)"
				ItemsHeight="-2"
				ItemsWidth="-2"
				/>
		</Category>

	</DialogView>
</FlexML>

	<!-- here are our definitions of datasources -->
	<DataSource ID="Root">
		<Property ID="ViewerGalleryRootDSTen" Type="DataSource" />
		<Property ID="ViewerGalleryRootDSTwenty" Type="DataSource" />
		<Property ID="ViewerGalleryRootDSSixty" Type="DataSource" />
		<Property ID="ViewerGalleryRootDSOneTwenty" Type="DataSource" />
		<Property ID="ViewerGalleryRootDSTwoFourty" Type="DataSource" />
		<Property ID="GalleryHugeDS" Type="DataSource" />
		<Property ID="GalleryCategoryDS" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDSTen">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue" Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem" Type="DataSource" />
		<Property ID="HighlightedItem" Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ExpandedItemsHeight" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Commands"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />

		<Event ID="OnDroppingCommand"/>
		<Event ID="OnClosingCommand" />
		<Event ID="OnContextMenuDroppingCommand"/>
		<Event ID="OnContextMenuClosingCommand" />
		<Event ID="OnLivePreviewStartCommand"/>
		<Event ID="OnLivePreviewStopCommand" />
		<Event ID="OnItemSelectionCommand" />
		<Event ID="OnAutoCompleteStartCommand"/>
		<Property ID="EventingItem" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDSTwenty">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue" Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem" Type="DataSource" />
		<Property ID="HighlightedItem" Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ExpandedItemsHeight" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Commands"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />

		<Event ID="OnDroppingCommand"/>
		<Event ID="OnClosingCommand" />
		<Event ID="OnContextMenuDroppingCommand"/>
		<Event ID="OnContextMenuClosingCommand" />
		<Event ID="OnLivePreviewStartCommand"/>
		<Event ID="OnLivePreviewStopCommand" />
		<Event ID="OnItemSelectionCommand" />
		<Event ID="OnAutoCompleteStartCommand"/>
		<Property ID="EventingItem" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDSSixty">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue" Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem" Type="DataSource" />
		<Property ID="HighlightedItem" Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ExpandedItemsHeight" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Commands"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />

		<Event ID="OnDroppingCommand"/>
		<Event ID="OnClosingCommand" />
		<Event ID="OnContextMenuDroppingCommand"/>
		<Event ID="OnContextMenuClosingCommand" />
		<Event ID="OnLivePreviewStartCommand"/>
		<Event ID="OnLivePreviewStopCommand" />
		<Event ID="OnItemSelectionCommand" />
		<Event ID="OnAutoCompleteStartCommand"/>
		<Property ID="EventingItem" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDSOneTwenty">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue" Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem" Type="DataSource" />
		<Property ID="HighlightedItem" Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ExpandedItemsHeight" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Commands"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />

		<Event ID="OnDroppingCommand"/>
		<Event ID="OnClosingCommand" />
		<Event ID="OnContextMenuDroppingCommand"/>
		<Event ID="OnContextMenuClosingCommand" />
		<Event ID="OnLivePreviewStartCommand"/>
		<Event ID="OnLivePreviewStopCommand" />
		<Event ID="OnItemSelectionCommand" />
		<Event ID="OnAutoCompleteStartCommand"/>
		<Property ID="EventingItem" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDSTwoFourty">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue" Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem" Type="DataSource" />
		<Property ID="HighlightedItem" Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ExpandedItemsHeight" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Commands"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />

		<Event ID="OnDroppingCommand"/>
		<Event ID="OnClosingCommand" />
		<Event ID="OnContextMenuDroppingCommand"/>
		<Event ID="OnContextMenuClosingCommand" />
		<Event ID="OnLivePreviewStartCommand"/>
		<Event ID="OnLivePreviewStopCommand" />
		<Event ID="OnItemSelectionCommand" />
		<Event ID="OnAutoCompleteStartCommand"/>
		<Property ID="EventingItem" Type="DataSource" />
	</DataSource>

	<DataSource ID="GalleryHugeDS">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue" Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem" Type="DataSource" />
		<Property ID="HighlightedItem" Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ExpandedItemsHeight" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Commands"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />

		<Event ID="OnDroppingCommand"/>
		<Event ID="OnClosingCommand" />
		<Event ID="OnContextMenuDroppingCommand"/>
		<Event ID="OnContextMenuClosingCommand" />
		<Event ID="OnLivePreviewStartCommand"/>
		<Event ID="OnLivePreviewStopCommand" />
		<Event ID="OnItemSelectionCommand" />
		<Event ID="OnAutoCompleteStartCommand"/>
		<Property ID="EventingItem" Type="DataSource" />
	</DataSource>

	<DataSource ID="GalleryCategoryDS">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue" Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem" Type="DataSource" />
		<Property ID="HighlightedItem" Type="DataSource" />
		<Property ID="SelectedString"   Type="String" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Tooltip" Type="String" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ExpandedItemsHeight" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="AnchorRepresentativeString"   Type="String"/>
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Commands"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />
		<Property ID="IsAutoCompleteEnabled" Type="Boolean" />

		<Event ID="OnDroppingCommand"/>
		<Event ID="OnClosingCommand" />
		<Event ID="OnContextMenuDroppingCommand"/>
		<Event ID="OnContextMenuClosingCommand" />
		<Event ID="OnLivePreviewStartCommand"/>
		<Event ID="OnLivePreviewStopCommand" />
		<Event ID="OnItemSelectionCommand" />
		<Event ID="OnAutoCompleteStartCommand"/>
		<Property ID="EventingItem" Type="DataSource" />
	</DataSource>
	
	<DataSource ID="GalleryCategory">
		<Property ID="Label" Type="String"/>
		<Property ID="Items" Type="List"/>
	</DataSource>

	<DataSource ID="GalleryCommand">
		<Property ID="Tcid"        Type="Int32"/>
		<Property ID="Label"       Type="String"/>
		<Property ID="ImageSource" Type="Image"/>
		<Event    ID="OnCommand" />
		<Property ID="Tooltip"     Type="String"/>
		<Property ID="ShowLabel"   Type="Boolean"/>
		<Property ID="IsBigButton" Type="Boolean"/>
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
	<GalleryCategoryDS>
		<Label>Gallery With Categories</Label>
		<Anchor>0</Anchor>
		<Layout>0</Layout>
		<ExpandedItemsHeight>2</ExpandedItemsHeight>
		<ItemsWidth>4</ItemsWidth>
		<ItemsHeight>2</ItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>

		<Commands>
			<GalleryCommand>
				<Label>Command 1</Label>
			</GalleryCommand>
		</Commands>

		<Categories>
			<GalleryCategory>
				<Label>Most recently used</Label>
				<Items>
					<GalleryItem>
						<Label>MRU 1</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>MRU One</SelectionValue>
					</GalleryItem>
					
					<GalleryItem>
						<Label>MRU 2</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>MRU Two</SelectionValue>
					</GalleryItem>
				</Items>
			</GalleryCategory>
			
			<GalleryCategory>
				<Label>Used on this presentation</Label>
				<Items>
					<GalleryItem>
						<Label>This 1</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>This One</SelectionValue>
					</GalleryItem>
					
					<GalleryItem>
						<Label>This 2</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>This Two</SelectionValue>
					</GalleryItem>
				</Items>
			</GalleryCategory>
			
			<GalleryCategory>
				<Label>Available for use</Label>
				<Items>
					<GalleryItem>
						<Label>Other 1</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>Other One</SelectionValue>
					</GalleryItem>
					
					<GalleryItem>
						<Label>Other 2</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>Other Two</SelectionValue>
					</GalleryItem>
					
					<GalleryItem>
						<Label>Other 3</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>Other Three</SelectionValue>
					</GalleryItem>
					
					<GalleryItem>
						<Label>Other 4</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>Other Four</SelectionValue>
					</GalleryItem>
					<GalleryItem>
						<Label>Other 5</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>Other five</SelectionValue>
					</GalleryItem>
					<GalleryItem>
						<Label>Other 6</Label>
						<ImageSource>light.bmp</ImageSource>
						<ImageWidth>-1</ImageWidth>
						<ImageHeight>-1</ImageHeight>
						<LargePreviewPercentImage>-1</LargePreviewPercentImage>
						<TextPercentImage>200</TextPercentImage>
						<TextPosition>1</TextPosition>
						<MenuSrcId>#0</MenuSrcId>
						<GroupID>1</GroupID>
						<SelectionValue>Other six</SelectionValue>
					</GalleryItem>
				</Items>
			</GalleryCategory>
		</Categories>
	</GalleryCategoryDS>
	
	<ViewerGalleryRootDSTen>
		<Label>Gallery Label</Label>
		<Anchor>0</Anchor>
		<Layout>1</Layout>
		<ExpandedItemsHeight>-1</ExpandedItemsHeight>
		<ItemsWidth>3</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<Commands>
			<GalleryCommand>
				<Label>Command 1</Label>
			</GalleryCommand>
		</Commands>

		<Items>
			<!-- one broken workbook in the list -->
			<GalleryItem>
				<Label>Item 1</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>One</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 2</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Two</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item3</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Three</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 4</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Four</SelectionValue>
			</GalleryItem>
			
			<GalleryItem>
				<Label>Item 5</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Five</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 6</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Six</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 7</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Seven</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 8 - hello</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Eight</SelectionValue>
			</GalleryItem>
			
			<GalleryItem>
				<Label>Item 9</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Nine</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 10</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Ten</SelectionValue>
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

	</ViewerGalleryRootDSTen>

	<ViewerGalleryRootDSTwenty>
		<Label>Gallery Label</Label>
		<Anchor>0</Anchor>
		<Layout>1</Layout>
		<ExpandedItemsHeight>-1</ExpandedItemsHeight>
		<ItemsWidth>3</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<Commands>
			<GalleryCommand>
				<Label>Command 1</Label>
			</GalleryCommand>
		</Commands>

		<Items>
			<GalleryItem>
				<Label>Item 1</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>One</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 2</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Two</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item3</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Three</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 4</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Four</SelectionValue>
			</GalleryItem>
			
			<GalleryItem>
				<Label>Item 5</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Five</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 6</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Six</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 7</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Seven</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 8 - hello</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Eight</SelectionValue>
			</GalleryItem>
			
			<GalleryItem>
				<Label>Item 9</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Nine</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 10</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Ten</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 1</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>One</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 2</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Two</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item3</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Three</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 4</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Four</SelectionValue>
			</GalleryItem>
			
			<GalleryItem>
				<Label>Item 5</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Five</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 6</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Six</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 7</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Seven</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 8 - hello</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Eight</SelectionValue>
			</GalleryItem>
			
			<GalleryItem>
				<Label>Item 9</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Nine</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 10</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Ten</SelectionValue>
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

	</ViewerGalleryRootDSTwenty>

	<ViewerGalleryRootDSSixty>
		<Label>Gallery Label</Label>
		<Anchor>0</Anchor>
		<Layout>1</Layout>
		<ExpandedItemsHeight>-1</ExpandedItemsHeight>
		<ItemsWidth>3</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<Commands>
			<GalleryCommand>
				<Label>Command 1</Label>
			</GalleryCommand>
		</Commands>

		<Items>
			<!-- 1 - 10 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 11 - 20 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 21 - 30 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 31 - 40 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 41 - 50 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 51 - 60 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
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

	</ViewerGalleryRootDSSixty>

	<ViewerGalleryRootDSOneTwenty>
		<Label>Gallery Label</Label>
		<Anchor>0</Anchor>
		<Layout>1</Layout>
		<ExpandedItemsHeight>-1</ExpandedItemsHeight>
		<ItemsWidth>3</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<Commands>
			<GalleryCommand>
				<Label>Command 1</Label>
			</GalleryCommand>
		</Commands>

		<Items>
			<!-- 1 - 10 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 11 - 20 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 21 - 30 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 31 - 40 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 41 - 50 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 51 - 60 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>			<!-- 1 - 10 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 11 - 20 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 21 - 30 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 31 - 40 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 41 - 50 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 51 - 60 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
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

	</ViewerGalleryRootDSOneTwenty>
	
	<ViewerGalleryRootDSTwoFourty>
		<Label>Gallery Label</Label>
		<Anchor>0</Anchor>
		<Layout>1</Layout>
		<ExpandedItemsHeight>-1</ExpandedItemsHeight>
		<ItemsWidth>3</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<Commands>
			<GalleryCommand>
				<Label>Command 1</Label>
			</GalleryCommand>
		</Commands>

		<Items>
			<!-- 1 - 10 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 11 - 20 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 21 - 30 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 31 - 40 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 41 - 50 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 51 - 60 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>			<!-- 1 - 10 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 11 - 20 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 21 - 30 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 31 - 40 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 41 - 50 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 51 - 60 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 1 - 10 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 11 - 20 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 21 - 30 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 31 - 40 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 41 - 50 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 51 - 60 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>			<!-- 1 - 10 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 11 - 20 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 21 - 30 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 31 - 40 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 41 - 50 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<!-- 51 - 60 -->
			<GalleryItem>
				<Label>Item 1</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 2</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 3</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 4</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 5</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 6</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 7</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 8</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 9</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
			</GalleryItem>
			<GalleryItem>
				<Label>Item 10</Label><ImageSource>light.bmp</ImageSource><ImageWidth>-1</ImageWidth><ImageHeight>-1</ImageHeight><LargePreviewPercentImage>-1</LargePreviewPercentImage><TextPercentImage>-1</TextPercentImage><TextPosition>1</TextPosition><GroupID>2</GroupID>
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

	</ViewerGalleryRootDSTwoFourty>

	<GalleryHugeDS>
		<Label>Gallery Label</Label>
		<Anchor>0</Anchor>
		<Layout>1</Layout>
		<ExpandedItemsHeight>-1</ExpandedItemsHeight>
		<ItemsWidth>3</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<Commands>
			<GalleryCommand>
				<Label>Command 1</Label>
			</GalleryCommand>
		</Commands>

		<Items>
			<!-- one broken workbook in the list -->
			<GalleryItem>
				<Label>Item 1</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>1200</ImageWidth>
				<ImageHeight>1200</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>One</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 2</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>1200</ImageWidth>
				<ImageHeight>1200</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Two</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item3</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>1200</ImageWidth>
				<ImageHeight>1200</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
				<SelectionValue>Three</SelectionValue>
			</GalleryItem>

			<GalleryItem>
				<Label>Item 4</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>1200</ImageWidth>
				<ImageHeight>1200</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>-1</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
				<SelectionValue>Four</SelectionValue>
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

	</GalleryHugeDS>
	</Root>

</FlexUI>
