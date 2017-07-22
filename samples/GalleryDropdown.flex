<!-- example package -->
<FlexUI>

	<!-- the ui goes under a flexml tag -->
	<FlexML>
		<NetUIXML>

			<Style ID="ComboTest" src="#DialogView">

				<Gallery Class="Dropdown">
					<Node.StyleTree>
						<element layoutChildren="horizontal">
							<Label text="------------------------------- Dropdown"/>

							<Dropdownanchor ID="Anchor" FlexMLContentID="GalleryDefault" layoutChildren="horizontal"
								Margin="4"
								ChildrenMargin="0"
								TailContext="*Bind(Property=DataSource)"
								ExpandToFillHoriz="*Bind(Property=CanGrow)"
								ContentItems="*Bind(Property=DataSource.Items)"
								TogglingCommand="StyledParent.GalleryDropdownToggling"
								IsEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"
								IsVisible="*Bind(Property=State.IsNotUndefined; BindType=OneWay)"
								LayoutPosition="*Bind(Property=State.IsUndefined; BindType=OneWay)"
								HighlightedItem="*Bind(Property=DataSource.HighlightedItem)"
								SelectedItem="*Bind(Property=DataSource.SelectedItem)"
								ListHeight="*Bind(Property=DataSource.ItemsHeight)"
								TelemetryId="*Bind(Property=TelemetryId; BindType=OneWay)"
								>

								<Viewer width="180">
									<Label 
									text="*Bind(Property=DataSource.HighlightedItem.Label;BindType=OneWay;UpdateType=Immediate)"
										Active="MouseAndKeyboard"
										BorderThickness="0,0,0,0" IsThemeEnabled="false" />
								</Viewer>

								<DropButton
									IsVisible="true"
									ClickCommand="Anchor.ToggleFlyout" />
							</Dropdownanchor>
						</element>
					</Node.StyleTree>
				</Gallery>			

			</Style>

			<DialogView Sheet="#ComboTest" DataSourceType="Root">

			<Gallery Class="Dropdown"
				Anchor="Dropdown"
				DataSource="*Bind(Property=ViewerGalleryRootDS)"
				>
			</Gallery>

			<EnterInteger Label="FilterIndex:" Value="*Bind(Property=ViewerGalleryRootDS.FilterIndex)" Minimum="-1" Maximum="1000" />
			<EnterInteger Label="SelectedIndex:" Value="*Bind(Property=ViewerGalleryRootDS.SelectedIndex)" Minimum="-1" Maximum="1000" />

			</DialogView>
		</NetUIXML>
	</FlexML>

	<!-- here are our definitions of datasources -->
	<DataSource ID="Root">
		<Property ID="ViewerGalleryRootDS" Type="DataSource" />
	</DataSource>

	<DataSource ID="ViewerGalleryRootDS">
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
		<ImageSource>light.bmp</ImageSource>

		<Anchor>0</Anchor>
		<Layout>1</Layout>

		<HighlightedValue>Highlighted Value</HighlightedValue>
		<SelectedValue>Selected Value</SelectedValue>
		<IsFilterVisible>true</IsFilterVisible>
		<ItemsWidth>400</ItemsWidth>
		<ItemsHeight>4</ItemsHeight>

		<Items>
			<GalleryItem>
				<Label>Always</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>200</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<Label>Later</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>200</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<Label>Never</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>200</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>2</GroupID>
			</GalleryItem>

			<GalleryItem>
				<Label>Now and then</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>200</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<Label>Occasionally</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>200</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<Label>Once in a while</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>200</TextPercentImage>
				<TextPosition>1</TextPosition>
				<MenuSrcId>#0</MenuSrcId>
				<GroupID>1</GroupID>
			</GalleryItem>

			<GalleryItem>
				<Label>Sometimes</Label>
				<ImageSource>light.bmp</ImageSource>
				<ImageWidth>-1</ImageWidth>
				<ImageHeight>-1</ImageHeight>
				<LargePreviewPercentImage>-1</LargePreviewPercentImage>
				<TextPercentImage>200</TextPercentImage>
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
