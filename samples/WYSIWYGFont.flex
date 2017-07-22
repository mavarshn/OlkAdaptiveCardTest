<FlexUI>
	<FlexML>
		<netuixml>

			<!-- styles -->
			<Style ID="FontList">
				<SelectSingleItem ID="List">
					<Node.StyleTree>
						<ListView Children="*Bind(Property=Children)" />
					</Node.StyleTree>
				</SelectSingleItem>

				<SelectionItem>
					<Node.StyleTree>
						<ListViewItem Text="*Bind(Property=Label)" />
					</Node.StyleTree>
				</SelectionItem>

				<SelectionItem ID="Separator">
					<Node.StyleTree>
						<ListViewItem>
							<ListContent ExpandToFillHoriz="True">
								<Line Type="Horizontal" ExpandToFillHoriz="True" />
							</ListContent>
						</ListViewItem>
					</Node.StyleTree>
				</SelectionItem>

				<Category>
					<Node.StyleTree>
						<Element LayoutChildren="vertical" Children="*Bind(Property=Children)"/>
					</Node.StyleTree>
				</Category>
			</Style>

			<!-- the logical tree for a font list -->
			<Category Sheet="#FontList" DataSourceType="WYSIWYGFontDropdown">
				<SelectSingleItem ID="List">
					<List Items="*Bind(Property=MRUFontList)">
						<ItemTemplate ForType="Font">
							<SelectionItem Label="*Bind(Property=Name)" />
						</ItemTemplate>
					</List>

					<SelectionItem ID="Separator" />

					<List Items="*Bind(Property=BaseFontList)">
						<ItemTemplate ForType="Font">
							<SelectionItem Label="*Bind(Property=Name)" />
						</ItemTemplate>
					</List>
				</SelectSingleItem>
			</Category>

		</netuixml>
	</FlexML>

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<!-- the main data source -->
	<DataSource ID="WYSIWYGFontDropdown">
		<Property ID="MRUFontList" Type="List" />
		<Property ID="BaseFontList" Type="List" />
	</DataSource>

	<!-- the list of installed fonts data source -->
	<DataSource ID="Font">
		<Property ID="Name" Type="String" />
	</DataSource>

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<!-- example data -->
	<WYSIWYGFontDropdown>

		<MRUFontList>
			<Font>
				<Name>Bookman</Name>
			</Font>
		</MRUFontList>

		<BaseFontList>
			<Font>
				<Name>Arial</Name>
			</Font>
			<Font>
				<Name>Bookman</Name>
			</Font>
			<Font>
				<Name>Courier</Name>
			</Font>
			<Font>
				<Name>Helvetica</Name>
			</Font>
			<Font>
				<Name>Wingdings</Name>
			</Font>
		</BaseFontList>

	</WYSIWYGFontDropdown>
</FlexUI>
