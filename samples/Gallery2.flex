<!-- example package -->
<FlexUI>

	<!-- the ui goes under a flexml tag -->
	<FlexML>
		<NetUIXML>
			<Style ID="GalleryTestView" src="#OfficeSpaceView">
				<Category>
					<Node.StyleTree>
						<element layoutChildren="horizontal" expandToFillHoriz="true"
							IsEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"
							IsVisible="*Bind(Property=State.IsNotUndefined; BindType=OneWay)"
							LayoutPosition="*Bind(Property=State.IsUndefined; BindType=OneWay)">

							<groupBox isCollapsible="true" groupType="groupheader" expandToFillHoriz="true">
								<groupheader linecolor="#flexSeparationLineColor" text="*Bind(Property=Label; BindType=OneWay)" expandToFillHoriz="true"/>
								<groupcontent expandToFillHoriz="true">
									<element expandToFillHoriz="true" Children="*Bind(Property=Children)" layoutChildren="vertical"/>
								</groupcontent>
							</groupBox>
							<image src="*Bind(Property=ImageSource; BindType=OneWay)"/>
						</element>
					</Node.StyleTree>
				</Category>
			</Style>
		</NetUIXML>
		<OfficeSpaceView Sheet="#GalleryTestView" DataSourceType="Root">

		<Category Label="Data Sourced Gallery">
			<Gallery ID="gallds" Class="DataSourced"
				DataSource="*Bind(Property=ViewerGalleryRootDS)"
				>
				<Gallery.Commands>
					<ExecuteAction Label="Foo" />
				</Gallery.Commands>
			</Gallery>
			<EnterString Label="The Selected Value of the Gallery above is:" Value="*Bind(Property=DataSource.SelectedValue; Source=gallds)"/>
			<EnterString Label="The Highlighted Value of the Gallery above is:" Value="*Bind(Property=DataSource.HighlightedValue; Source=gallds)"/>
		</Category>
	
		<Category Label="Data Sourced Gallery2">
			<Gallery ID="gallds2" Class="DataSourced"
				DataSource="*Bind(Property=ViewerGalleryRootDS)"
				>
				<Gallery.Commands>
					<ExecuteAction Label="Foo" />
				</Gallery.Commands>
			</Gallery>
			<EnterString Label="The Selected Value of the Gallery above is:" Value="*Bind(Property=DataSource.SelectedValue; Source=gallds2)"/>
		</Category>
		<Category Label="Gallery with Categories">
			<Gallery ID="gallcat" Class="DataSourced" DataSource="*Bind(Property=GalleryCategoryDS)" />
		
			<EnterString Label="The Selected Value of the Gallery above is:" Value="*Bind(Property=DataSource.SelectedValue; Source=gallcat)"/>
		</Category>
		<Category Label="Horizontal Gallery">

			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="SplitButton"
				Layout="horizontal" 
				Label="Horizontal, items only" 
				Items="*Bind(Property=ViewerGalleryRootDS.Items)"
				ItemsHeight="1"
				CanGrow="true"
				/>
		</Category>
		<Category Label="Horizontal Gallery with filter">

			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="none"
				Layout="horizontal" 
				Label="Horizontal, items+filter" 
				IsFilterVisible="true"
				Items="*Bind(Property=ViewerGalleryRootDS.Items)"
				InRibbonItemsHeight="2"
				FilterItems="*Bind(Property=ViewerGalleryRootDS.FilterItems)"
				CanGrowVert="true"
				/>
		</Category>
<!--
		<Category Label="Grid Gallery with filter">

			<Gallery 
				Class="simple"
				ID="horizg"
				Anchor="DropButton"
				Layout="Grid" 
				Label="Grid, items+filter" 
				Items="*Bind(Property=ViewerGalleryRootDS.Items)"
				ItemsHeight="2"
				FilterItems="*Bind(Property=ViewerGalleryRootDS.FilterItems)"
				IsFilterVisible="true"
				CanGrowVert="true"
				CanGrow="true"
				/>
		</Category>
		<Category Label="Vertical-popup">
			<Gallery 
				Class="simple"
				Anchor="DropButton"
				Layout="vertical"
				Label="vert"
				CanGrowVert="true"
				Items="*Bind(Property=ViewerGalleryRootDS.Items)"
				ItemsHeight="4"
				ItemsWidth="*Bind(Property=ViewerGalleryRootDS.ItemsWidth)"
				Commands="*Bind(Property=ViewerGalleryRootDS.Commands)"
				/>

		</Category>
		<Category Label="Vertical-popup with categories">
			<Gallery 
				Class="simple"
				Anchor="DropButton"
				Layout="vertical"
				Label="vert"
				CanGrowVert="true"
				Categories="*Bind(Property=GalleryCategoryDS.Categories)"
				ItemsHeight="3"
				Commands="*Bind(Property=ViewerGalleryRootDS.Commands)"
				/>

		</Category>
-->
	</OfficeSpaceView>
</FlexML>

	<!-- here are our definitions of datasources -->
	<DataSource ID="Root">
		<Property ID="ViewerGalleryRootDS" Type="DataSource" />
		<Property ID="GalleryCategoryDS" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDS">
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
		<Property ID="InRibbonItemsHeight" Type="Int32" />
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
		<Property ID="InRibbonItemsHeight" Type="Int32" />
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

		<Property ID="CanGrow" Type="Boolean" />
		<Property ID="CanGrowVert" Type="Boolean" />

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

	<DataSource ID="GalleryCommandCategory" BasedOn="OfficeSpace::FSMenuCategory"/>
	<DataSource ID="GalleryCommand" BasedOn="OfficeSpace::FSExecuteAction"/>

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
		<ItemsHeight>2</ItemsHeight>
		<ItemsWidth>4</ItemsWidth>
		<InRibbonItemsHeight>2</InRibbonItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<CanGrowVert>true</CanGrowVert>

		<Commands>
			<GalleryCommandCategory>
				<Class>StandardItems</Class>
				<IsVisible>true</IsVisible>
				<Enabled>true</Enabled>
				<Items>
					<GalleryCommand>
						<IsVisible>true</IsVisible>
						<Enabled>true</Enabled>
						<Label>&amp;Command 1</Label>
					</GalleryCommand>
				</Items>
			</GalleryCommandCategory>
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
	
	<ViewerGalleryRootDS>
		<Label>Gallery Label</Label>
		<Anchor>0</Anchor>
		<Layout>1</Layout>
		<ItemsHeight>-1</ItemsHeight>
		<ItemsWidth>3</ItemsWidth>
		<InRibbonItemsHeight>4</InRibbonItemsHeight>
		<IsSelectionRequired>true</IsSelectionRequired>
		<Commands>
			<GalleryCommandCategory>
				<Class>StandardItems</Class>
				<IsVisible>true</IsVisible>
				<Enabled>true</Enabled>
				<Items>
					<GalleryCommand>
						<IsVisible>true</IsVisible>
						<Enabled>true</Enabled>
						<Label>&amp;Command 1</Label>
					</GalleryCommand>
				</Items>
			</GalleryCommandCategory>
		</Commands>

		<Items>
			<!-- one broken workbook in the list -->
			<GalleryItem>
				<Label>Item 1</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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
				<ImageWidth>16</ImageWidth>
				<ImageHeight>16</ImageHeight>
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

	</ViewerGalleryRootDS>
	</Root>



</FlexUI>
