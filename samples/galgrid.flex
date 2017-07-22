<!-- example package -->
<FlexUI>
	
	<!-- the ui goes under a flexml tag -->
	<FlexML>

		<NetUIXML>
<!-- to override the styletree for the combobox anchor, uncomment the following: -->
<Style ID="ComboTest" src="#DialogView">
<Gallery Class="CTXDataSourced" Condition="Anchor==ComboBox">
	<Node.StyleTree>
		<comboboxanchor ID="Anchor" FlexMLContentID="GalleryDefault" layoutChildren="horizontal"
			ChildrenMargin="0"
			TailContext="*Bind(Property=DataSource)"
			ContentItems="*Bind(Property=DataSource.Items)"
			TogglingCommand="StyledParent.GalleryDropdownToggling"
			IsEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"
			IsVisible="*Bind(Property=State.IsNotUndefined; BindType=OneWay)"
			LayoutPosition="*Bind(Property=State.IsUndefined; BindType=OneWay)"
			>

			<SimpleButton Class="GalButton"
				ChildrenMargin="0"
				layoutchildren="horizontal"
				AccessibleName="Drop Button"
				ExpandToFillVert="true"
				AlignChildren="center">
				
				<Image
					padding="0,0,5,0"
					Src="*Bind(Property=DataSource.ImageSource;BindType=OneWay;UpdateType=Immediate)" />

				<textbox width="80" isEditable="true" isMultiline="false"
					IsThemeEnabled="false"
					text="*Bind(Property=DataSource.Label;BindType=OneTime;UpdateType=Immediate)"
					/>

				<line ExpandToFillVert="true" Stroke="#FsButtonBorder" Width="1" />

				<SimpleButton Text="6" FontFace="Marlett" FontSize="9pt"
					textalign="middleLeft"
					AccessibleName="Drop Button" ExpandToFillVert="true"
					foreground="buttonText"
					ClickCommand="Anchor.ToggleFlyout" />

			</SimpleButton>
		</comboboxanchor>
	</Node.StyleTree>
</Gallery>
</Style>

<!--  use the dialogview with custom sheet to override the styletree for combobox anchor -->
		<DialogView Sheet="#ComboTest" DataSourceType="Root">
<!--
		<DialogView>
-->
			<Category Label="Gallery with Categories">
				<Gallery ID="gallcat" Class="DataSourced" DataSource="*Bind(Property=GalleryCategoryDS)"/>
			
				<EnterString Label="The Selected Value of the Gallery above is:" Value="*Bind(Property=DataSource.SelectedValue; Source=gallcat)"/>
			</Category>
		
		</DialogView>
		</NetUIXML>
	</FlexML>

	<!-- here are our definitions of datasources -->
	<DataSource ID="Root">
		<Property ID="ViewerGalleryRootDS" Type="DataSource" />
		<Property ID="GalleryCategoryDS" Type="DataSource" />
	</DataSource>

	<DataSource ID="GalleryCategoryDS">
		<Property ID="Label" Type="String" />
		<Property ID="SelectedValue"    Type="String" />
		<Property ID="HighlightedValue" Type="String" />
		<Property ID="SelectedItem"     Type="DataSource" />
		<Property ID="HighlightedItem"  Type="DataSource" />
		<Property ID="ImageSource" Type="Image" />
		<Property ID="Anchor" Type="Int32" />
		<Property ID="Layout" Type="Int32" />
		<Property ID="ItemsWidth" Type="Int32" />
		<Property ID="ItemsHeight" Type="Int32" />
		<Property ID="Categories" Type="List" />
		<Property ID="Items" Type="List" />
		<Property ID="FilterItems" Type="List" />
		<Property ID="Menus"       Type="List" />

		<Property ID="SelectedIndex" Type="Int32" />
		<Property ID="FilterIndex" Type="Int32" />

		<Property ID="IsFilterVisible" Type="Boolean" />
		<Property ID="IsBitFiltering" Type="Boolean" />
		<Property ID="IsSelectionRequired" Type="Boolean" />

		<Event ID="OnItemMenuCommand"/>
		<Event ID="OnDroppingCommand"/>
		<Property ID="LastItemMenuCommandItemIndex" Type="Int32" />
		<Property ID="LastItemMenuCommandMenuIndex" Type="Int32" />
	</DataSource>
	
	<DataSource ID="GalleryCategory">
		<Property ID="Label" Type="String"/>
		<Property ID="Items" Type="List"/>
	</DataSource>

	<DataSource ID="GalleryItem">
		<Property ID="Label" Type="String" />
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
		<!-- Anchor 0:none, 1: dropbuttonlarge, 2:dropbuttonstandard 3:dropbuttonsmall 4:dropdown 5: combobox -->
		<Anchor>1</Anchor>
		<!-- layout 0:horiz 1:vert 2:grid -->
		<Layout>2</Layout>
		<ItemsWidth>500</ItemsWidth>
		<ItemsHeight>-1</ItemsHeight>
		
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
				</Items>
			</GalleryCategory>
		</Categories>
	</GalleryCategoryDS>
	
	</Root>

</FlexUI>
