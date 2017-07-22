<!-- Ribbon mockup -->
<FlexUI>
	
	<!-- the ui (View and FlexML) goes under a flexml tag -->

	<FlexML>
	
		<NetUIXML>

		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
		<!-- Ribbon View -->
		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

		<Style ID="Ribbon">

			<!-- Ribbon's View tag gets styled as NetUI Tab control  -->
			<Category ID="Ribbon">
				<Node.StyleTree>
					<TabControl Children="*Bind(Property=Children)" Height="130" />
				</Node.StyleTree>
			</Category>

			<!-- Ribbon Tab gets styled as NetUI Tab control's TabPage, Tab children are bound as TabPage's children  -->
			<Category ID="Tab">
				<Node.StyleTree>
					<TabPage Text="*Bind(Property=Label)" Children="*Bind(Property=Children)" layoutChildren="horizontal">
					</TabPage>
				</Node.StyleTree>
			</Category>

			<!-- Ribbon Chunk gets styled as NetUI GroupBox control, Chunk children are bound as groupContent children  -->
			<Category ID="Chunk">
				<Node.StyleTree>
					<groupBox grouptype="groupbox" iscollapsible="false" expandtofillhoriz="false" expandtofillvert="true">
						<groupheader Text="*Bind(Property=Label)"/>
						<groupContent Children="*Bind(Property=Children)">
						</groupContent>
					</groupBox>
				</Node.StyleTree>
			</Category>
			<ShowInformation>
				<Node.StyleTree>
					<Label Text="*Bind(Property=Label)"/>
				</Node.StyleTree>
			</ShowInformation>

			<!-- I had to replicate BooleanChoice and ExecuteAction styles because it is not possible to sub-class View style in a markup yet  -->
			<!-- If this worked, we would've just used default BooleanChoice and ExecuteAction styles  -->
			<BooleanChoice>
				<Node.StyleTree>
					<element 
						layoutChildren="vertical"
						ExpandToFillHoriz="true"
						IsEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"
						IsVisible="*Bind(Property=State.IsNotUndefined; BindType=OneWay)"
						LayoutPosition="*Bind(Property=State.IsUndefined; BindType=OneWay)">
						
						<element layoutChildren="horizontal">
							<image src="*Bind(Property=ImageSource)"/>
							<checkbox text="*Bind(Property=Label)" isChecked="*Bind(Property=Value)"/>
						</element>
						<label text="*Bind(Property=Description)" padding="#flexDescriptionPadding" foreground="#flexDescriptionTextColor" textAlign="wrapLeft"/>
					</element>
				</Node.StyleTree>
			</BooleanChoice>

			<ExecuteAction>
				<Node.StyleTree>
					<button
						imageSrc="*Bind(Property=ImageSource)"
						text="*Bind(Property=Label)"
						clickCommand="StyledParent.ExecuteActionCommand"
						IsEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"
						IsVisible="*Bind(Property=State.IsNotUndefined; BindType=OneWay)"
						LayoutPosition="*Bind(Property=State.IsUndefined; BindType=OneWay)" />
				</Node.StyleTree>
			</ExecuteAction>

		</Style>


		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
		<!-- Ribbon FlexML  -->
		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

		<Category ID="Ribbon" Sheet="#Ribbon" DataSourceType="Ribbon">
			<!-- Bind list of tabs in a Ribbon -->
			<List Items="*Bind(Property=Tabs)">
				<ItemTemplate ForType="Tab">
					<Category ID="Tab" Label="*Bind(Property=Name)">
						<!-- Bind list of chunks in a tab -->
						<List Items="*Bind(Property=Chunks; BindType=OneWay)">
							<ItemTemplate ForType="Chunk">
								<Category ID="Chunk" Label="*Bind(Property=Name)">
									<!-- Bind list of controls in a chunk -->
									<List Items="*Bind(Property=Controls)">
										<ItemTemplate ForType="BooleanChoice">
											<BooleanChoice Label="*Bind(Property=Label)" Value="*Bind(Property=Value)">
											</BooleanChoice>
										</ItemTemplate>
										<ItemTemplate ForType="ExecuteAction">
											<ExecuteAction Label="*Bind(Property=Label)" Command="*Bind(Property=Action)">
											</ExecuteAction>
										</ItemTemplate>
									</List>
								</Category>
							</ItemTemplate>
						</List>
					</Category>
				</ItemTemplate>
			</List>
		</Category>

		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
		<!-- This section is debug UI that allows to change values and enabled/disalbed state of a source -->
		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

		<DialogView HasOK="false" HasCancel="false" DataSourceType="Ribbon">
			<ShowInformation Label="Debug"/> 
			<List Items="*Bind(Property=Tabs)">
				<ItemTemplate ForType="Tab">
					<Category Label="*Bind(Property=Name)">
						<List Items="*Bind(Property=Chunks)">
							<ItemTemplate ForType="Chunk">
								<Category Label="*Bind(Property=Name)">
									<List Items="*Bind(Property=Controls)">
										<ItemTemplate ForType="BooleanChoice">
											<Category Label="*Bind(Property=Label)">
												<BooleanChoice ID="Target" Label="*Bind(Property=Label)" Value="*Bind(Property=Value)"/>
												<BooleanChoice Label="IsEnabled" Value="*Bind(Property=State.IsNotReadOnly;Source=Target)"/>
											</Category>
										</ItemTemplate>
										<ItemTemplate ForType="ExecuteAction">
											<Category Label="*Bind(Property=Label)">
												<ExecuteAction ID="Target" Label="*Bind(Property=Label)" Command="*Bind(Property=Action)"/>
												<BooleanChoice Label="IsEnabled" Value="*Bind(Property=State.IsNotReadOnly;Source=Target)"/>
											</Category>
										</ItemTemplate>
									</List>
								</Category>
							</ItemTemplate>
						</List>
					</Category>
				</ItemTemplate>
			</List>
		</DialogView>

		</NetUIXML>	
	</FlexML>

	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
	<!-- Ribbon datasources: Ribbon->Tab->Chunk->Control->[BooleanChoice|ExecuteAction] -->
	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

	<!-- Root Ribbon datasource, contains a list of Tabs -->
	<DataSource ID="Ribbon">
		<Property ID="Tabs" Type="List" />
	</DataSource>

	<!-- Tab datasource, contains its name and a list of Chunks -->
	<DataSource ID="Tab">
		<Property ID="Name" Type="String" />
		<Property ID="Chunks" Type="List" />
	</DataSource>

	<!-- Chunk datasource, contains its name and a list of Controls -->
	<DataSource ID="Chunk">
		<Property ID="Name" Type="String" />
		<Property ID="Controls" Type="List" />
	</DataSource>

	<!-- BooleanChoice datasource, contains Label and its Value -->
	<DataSource ID="BooleanChoice">
		<Property ID="Label" Type="String" />
		<Property ID="Value" Type="Boolean" />
	</DataSource>

	<!-- ExecuteAction datasource, contains Label and its Action event -->
	<DataSource ID="ExecuteAction">
		<Property ID="Label" Type="String" />
		<Property ID="Action" Type="Event" />
	</DataSource>

	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
	<!-- Ribbon data -->
	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
	<Ribbon>
		<Tabs>
			<!-- List of Ribbon tabs -->
			<Tab>
				<Name>Writing</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Text</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
							<ExecuteAction>
								<Label>ExecuteAction</Label>
							</ExecuteAction>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Clipboard</Name>
					</Chunk>
					<Chunk>
						<Name>Find</Name>
					</Chunk>
					<Chunk>
						<Name>View</Name>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Insert</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Illustrations</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Text</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Format</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Text Wrap</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Crop</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Size</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Rotate</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Caption</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Brightness</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Colors</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Borders</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Page Layout</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Columns</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Margins</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Breaks</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Paper</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Headers</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Background</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>View</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Lists</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>List Tools</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Appearance</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Outlining</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Tables</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Draw Table</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Insert</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Delete</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Merge/Split</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Table Appearance</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Alignment</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>AutoFit</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Convert</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Data</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Properties</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Drawing</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Shapes</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Rotate</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Nudge</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Order</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Group</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Align</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Text Wrap</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Review</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Show Markup</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Comments</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Track Changes</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Letters and Mailings</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Letter Wizard</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Envelopes and Labels</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Mail Merge</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
			<Tab>
				<Name>Long Documents</Name>
				<Chunks>
					<!-- List of tab chunks -->
					<Chunk>
						<Name>Footnotes</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Caption</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Cross Reference</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Quotations</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Index</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Table of Contents</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
					<Chunk>
						<Name>Bibliography</Name>
						<Controls>
							<!-- List of controls in a chunk -->
							<BooleanChoice>
								<Label>Control</Label>
							</BooleanChoice>
						</Controls>
					</Chunk>
				</Chunks>
			</Tab>
		</Tabs>
	</Ribbon>

</FlexUI>
