<!-- Excel Filter Menu mockup -->
<FlexUI>
	
	<!-- the ui (View and FlexML) goes under a flexml tag -->

	<FlexML>
	
		<NetUIXML>

		<DeclareCustomConcept Name="ImageExecuteAction" Base="ExecuteAction">
			<DeclareProperty Name="img1" Type="Image"/>
			<DeclareProperty Name="img2" Type="Image"/>
		</DeclareCustomConcept>
		<DeclareCustomConcept Name="ColorBooleanChoice" Base="BooleanChoice">
			<DeclareProperty Name="Color" Type="Color"/>
		</DeclareCustomConcept>

		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
		<!-- Excel Filter Menu View -->
		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

		<Style ID="DialogStyle" src="#DialogStyles">
			<!-- The compiler requires that a Style block have anything in it just so it isn't considered an empty style block and ignored. -->
			<label class="needAnythingToMakeTheCompilerHappy"/>
		</Style>

		<Style ID="DialogButton" src="#DialogView">
			<Category ID="FilterOkCancelGroup">
				<Node.StyleTree>
					<element layoutChildren="horizontal"
						Sheet="#DialogStyle"
						AlignChildren="center" 
						ExpandToFillHoriz="true" 
						SameWidthChildren="true"
						Children="*Bind(Property=Children)"
					/> 
				</Node.StyleTree>
			</Category>

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
						<label ID="desc" text="*Bind(Property=Description)" textAlign="wrapLeft"/>
					</element>
					<PropertyTriggers>
						<Trigger condition="Description == STRING_NULL">
							<label Target="desc" layoutPosition="none"/>
						</Trigger>
						<Trigger condition="Description != STRING_NULL">
							<label Target="desc" layoutPosition="auto"/>
						</Trigger>
					</PropertyTriggers>
				</Node.StyleTree>
			</BooleanChoice>

		</Style>

		<Style ID="FilterMenuView" src="#MenuView">

			<!-- Override the MenuView style to not use a PanViewer -->
			<MenuView>
				<Node.StyleTree>
					<TWMenuContainer LayoutChildren="Overlap">
						<Element Class="MenuContainer" Children="*Bind(Property=Children)" LayoutChildren="Vertical"/>
					</TWMenuContainer>
				</Node.StyleTree>
			</MenuView>

			<ColorBooleanChoice>
				<Node.StyleTree>
					<TWBtnCheckMenuItem
						IsItemEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"
						IsItemChecked="*Bind(Property=Value; BindType=TwoWay)"
						ClickCommand="StyledParent.ExecuteActionCommand"
						LayoutChildren="Overlap">
						<Element Class="ItemContentsContainer" LayoutChildren="Horizontal">
							<Image ID="Image" Class="MenuItemImage"
								Src="*Bind(Property=ImageSource; BindType=OneWay)"
								IsEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"/>

							<Element Class="LabelContainer" LayoutChildren="Horizontal" Padding="2,2,2,2">
								<Label ID="ItemLabel" Text="Error:  Not Set" LayoutPosition="none" />
								<Element Background="*Bind(Property=Color)" ExpandToFillVert="true" Height="16" Width="40"/>
							</Element>

						</Element>
						<Element Class="TrackingBorderContainer" LayoutChildren="Horizontal">
							<Element ID="TrackingBorder" LayoutChildren="Horizontal"/>
						</Element>
					</TWBtnCheckMenuItem>
					<PropertyTriggers>
						<Trigger Condition="Value==true">
							<Image Target="Image" Class="MenuItemImageChecked"/>
						</Trigger>
						<Trigger Condition="Value==false">
							<Image Target="Image" Class="MenuItemImage"/>
						</Trigger>
					</PropertyTriggers>
				</Node.StyleTree>
			</ColorBooleanChoice>

			<!-- FilterMenu tag is the root menu control  -->
			<Category ID="FilterMenu">
				<Node.StyleTree>
					<element layoutChildren="vertical" Children="*Bind(Property=Children)" background="buttonface"/>
				</Node.StyleTree>
			</Category>

			<!-- FilterList gets styled as NetUI TreeView control, with FilterGroup and FilterItems as TreeViewItem children  -->
			<Category ID="FilterList">
				<Node.StyleTree>
					<twmenuitem LayoutChildren="horizontal" expandToFillVert="true" expandToFillHoriz="true">
						<image Class="MenuItemImage" expandToFillVert="true"/>
						<Label ID="ItemLabel" Text="Error:  Need proper label here" LayoutPosition="none" />
						<TreeView Sheet="#DialogStyle" Children="*Bind(Property=Children)" expandToFillVert="true" expandToFillHoriz="true" height="149"/>
					</twmenuitem>
				</Node.StyleTree>
			</Category>

			<!-- FilterGroups and FilterItems gets styled as NetUI TreeViewItem control with a checkbox, with other children items bound as treeview children  -->
			<Category ID="FilterGroup">
				<Node.StyleTree>
					<TreeViewItem margin="0" allColMargins="2" allRowMargins="0">
						<TreeViewExpander/>
						<TreeViewContent>
							<Checkbox Text="*Bind(Property=Label)" isChecked="*Bind(Property=Value)"/>
						</TreeViewContent>
						<TreeViewChildren Children="*Bind(Property=Children)"/>
					</TreeViewItem>
				</Node.StyleTree>
			</Category>
			<Category ID="FilterItem">
				<Node.StyleTree>
					<TreeViewItem margin="0" allColMargins="2" allRowMargins="0">
						<TreeViewContent>
							<Checkbox Text="*Bind(Property=Label)" isChecked="*Bind(Property=Value)"/>
						</TreeViewContent>
						<TreeViewChildren Children="*Bind(Property=Children)"/>
					</TreeViewItem>
				</Node.StyleTree>
			</Category>
			<Category ID="FilterItem" Class="Important">
				<Node.StyleTree>
					<TreeViewItem margin="0" allColMargins="2" allRowMargins="0">
						<TreeViewContent>
							<Checkbox FontWeight="Bold" Text="*Bind(Property=Label)" isChecked="*Bind(Property=Value)"/>
						</TreeViewContent>
						<TreeViewChildren Children="*Bind(Property=Children)"/>
					</TreeViewItem>
				</Node.StyleTree>
			</Category>

			<ImageExecuteAction>
				<Node.StyleTree>
					<TWBtnMenuItem
						IsItemEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"
						ClickCommand="StyledParent.ExecuteActionCommand"
						LayoutChildren="Overlap">

						<Element Class="ItemContentsContainer" LayoutChildren="Horizontal">
							<Image Class="MenuItemImage"
								Src="*Bind(Property=ImageSource; BindType=OneWay)"
								IsEnabled="*Bind(Property=State.IsNotReadOnly; BindType=OneWay)"/>

							<Element Class="LabelContainer" LayoutChildren="Horizontal" Padding="2,2,2,2">
								<image expandToFillVert="true" src="*Bind(Property=img1)"/>
								<image expandToFillVert="true" src="*Bind(Property=img2)"/>
								<label ID="ItemLabel" text="*Bind(Property=Label)"/>
							</Element>

						</Element>
						<Element Class="TrackingBorderContainer" LayoutChildren="Horizontal">
							<Element ID="TrackingBorder" LayoutChildren="Horizontal"/>
						</Element>

					</TWBtnMenuItem>
				</Node.StyleTree>
			</ImageExecuteAction>

			<ShowInformation>
				<Node.StyleTree>
					<Label Text="*Bind(Property=Label)"/>
				</Node.StyleTree>
			</ShowInformation>

			<checkbox condition="text==Show All" fontWeight="bold"/>
		</Style>


		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
		<!-- Excel Filter Menu FlexML  -->
		<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

		<MenuView DataSourceType="*Any" Sheet="#FilterMenuView">
			<Category Class="StandardItems">
				<ExecuteAction Label="NOTE:  This sample causes asserts in twmenu.cpp which must be ignored!" IsVisible="true"/>
				<ExecuteAction Label="Sort Ascending" IsVisible="true" Command="*Bind(Event=Ascending)"/>
				<ExecuteAction Label="Sort Descending" IsVisible="true" Command="*Bind(Event=Descending)"/>
				<ImageExecuteAction Label="Multiple Images" img1=":rcicon(320)" img2=":rcicon(321)"/>
			</Category>

			<Category Class="StandardItems">
				<ColorBooleanChoice Command="*Bind(Event=Color1)" Color="#ff0000"/>
				<ColorBooleanChoice Command="*Bind(Event=Color1)" Value="true" Color="#00ff00"/>
				<ColorBooleanChoice Command="*Bind(Event=Color1)" Color="gradient(red,blue,horizontal)"/>
				<ColorBooleanChoice Command="*Bind(Event=Color1)" Color="gradient(red,blue,vertical)"/>
			</Category>

			<!-- Bind list of Items in the menu -->
			<List Items="*Bind(Property=ItemsProp)">
				<ItemTemplate ForType="FilterMenuGroup">
					<Category Class="StandardItems">
						<List Items="*Bind(Property=Items)">
							<ItemTemplate ForType="FilterBooleanChoice">
								<BooleanChoice IsVisible="true" Label="*Bind(Property=Label)" Value="*Bind(Property=Value)"/>
							</ItemTemplate>
							<ItemTemplate ForType="FilterExecuteAction">
								<ExecuteAction Label="*Bind(Property=Label)" IsVisible="true" Command="*Bind(Property=Action)"/>
							</ItemTemplate>
							<ItemTemplate ForType="FilterSubMenu">
								<FlyoutAnchor IsVisible="true" Class="submenu" Label="*Bind(Property=Label)"/>
							</ItemTemplate>
							<ItemTemplate ForType="FilterShowInformation">
								<ShowInformation Label="*Bind(Property=Label)"/>
							</ItemTemplate>
						</List>
					</Category>
				</ItemTemplate>
			</List>
			<Category ID="FilterList" Label="*Bind(Property=FilterList.Name)">
				<Category ID="FilterItem" Class="Important" Label="My New Show All" Value="*Bind(Property=Value)"/>
				<!-- Bind list of filter groups -->
				<List Items="*Bind(Property=FilterList.FilterGroups)">
					<ItemTemplate ForType="FilterItem">
						<Category ID="FilterItem" Label="*Bind(Property=Name)" Value="*Bind(Property=Value)"/>
					</ItemTemplate>
					<ItemTemplate ForType="FilterGroup">
						<Category ID="FilterGroup" Label="*Bind(Property=Name)" Value="*Bind(Property=Value)">
							<!-- Bind list of filter items -->
							<List Items="*Bind(Property=FilterItems)">
								<ItemTemplate ForType="FilterItem">
									<Category ID="FilterItem" Label="*Bind(Property=Name)" Value="*Bind(Property=Value)">
										<!-- Bind Day -->
										<List Items="*Bind(Property=FilterDays)">
											<ItemTemplate ForType="FilterDay">
												<Category ID="FilterItem" Label="*Bind(Property=Name)" Value="*Bind(Property=Value)">
													<!-- Bind Hour -->
													<List Items="*Bind(Property=FilterHours)">
														<ItemTemplate ForType="FilterHour">
															<Category ID="FilterItem" Label="*Bind(Property=Name)" Value="*Bind(Property=Value)">
																<!-- Bind Minute -->
																<List Items="*Bind(Property=FilterMinutes)">
																	<ItemTemplate ForType="FilterMinute">
																		<Category ID="FilterItem" Label="*Bind(Property=Name)" Value="*Bind(Property=Value)">
																			<!-- Bind Second -->
																			<List Items="*Bind(Property=FilterSeconds)">
																				<ItemTemplate ForType="FilterSecond">
																					<Category ID="FilterItem" Label="*Bind(Property=Name)" Value="*Bind(Property=Value)">
																					</Category>
																				</ItemTemplate>
																			</List>
																		</Category>
																	</ItemTemplate>
																</List>
															</Category>
														</ItemTemplate>
													</List>
												</Category>
											</ItemTemplate>
										</List>
									</Category>
								</ItemTemplate>
							</List>
						</Category>
					</ItemTemplate>
				</List>
			</Category>
			<BooleanChoice Sheet="#DialogButton" Label="Show Individual Values" Value="*Bind(Property=ShowIndividualValues)"/>
			<ShowInformation Label="*Bind(Property=NumSelected)"/>

			<Category Sheet="#DialogButton" ID="FilterOkCancelGroup">
				<ExecuteAction IsVisible="true" Label="OK" />
				<ExecuteAction Sheet="#DialogButton" IsVisible="true" Label="Cancel" />
			</Category>
		</MenuView>

		</NetUIXML>	
	</FlexML>

	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
	<!--
		Filter Menu datasources:
			FilterMenu
				FilterBooleanChoice
				FilterExecuteAction
				FilterShowInformation
				FilterList
					FilterList.FilterGroups
						FilterGroup
							FilterGroup.FilterItems
								FilterItem
									FilterItem.FilterDays
										FilterDay
											FilterDay.FilterHours
												FilterHour
													FilterHour.FilterMinutes
														FilterMinute
															FilterMinute.FilterSeconds
																FilterSeconds
	-->
	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

	<!-- Root FilterMenu datasource, contains a list of items or FilterList -->
	<DataSource ID="FilterMenu">
		<Property ID="ItemsProp" Type="List" />
		<Event ID="Ascending" />
		<Event ID="Descending" />
		<Property ID="FilterList" Type="DataSource" />
		<Property ID="ShowIndividualValues" Type="Boolean" />
		<Property ID="NumSelected" Type="String" />
	</DataSource>

	<!-- FilterList datasource, contains its name and a list of FilterGroups -->
	<DataSource ID="FilterList">
		<Property ID="Name" Type="String" />
		<Property ID="FilterGroups" Type="List" />
	</DataSource>

	<!-- FilterMenuGroups datasource, contains its name and a list of FilterItems -->
	<DataSource ID="FilterMenuGroup">
		<Property ID="Items" Type="List" />
	</DataSource>

	<!-- FilterGroups datasource, contains its name and a list of FilterItems -->
	<DataSource ID="FilterGroup">
		<Property ID="Name" Type="String" />
		<Property ID="Value" Type="Boolean" />
		<Property ID="FilterItems" Type="List" />
	</DataSource>

	<!-- FilterItems datasource, contains its name and a list of Controls -->
	<DataSource ID="FilterItem">
		<Property ID="Name" Type="String" />
		<Property ID="Value" Type="Boolean" />
		<Property ID="FilterDays" Type="List" />
	</DataSource>

	<DataSource ID="FilterDay">
		<Property ID="Name" Type="String" />
		<Property ID="Value" Type="Boolean" />
		<Property ID="FilterHours" Type="List" />
	</DataSource>

	<DataSource ID="FilterHour">
		<Property ID="Name" Type="String" />
		<Property ID="Value" Type="Boolean" />
		<Property ID="FilterMinutes" Type="List" />
	</DataSource>

	<DataSource ID="FilterMinute">
		<Property ID="Name" Type="String" />
		<Property ID="Value" Type="Boolean" />
		<Property ID="FilterSeconds" Type="List" />
	</DataSource>

	<DataSource ID="FilterSecond">
		<Property ID="Name" Type="String" />
		<Property ID="Value" Type="Boolean" />
	</DataSource>

	<!-- FilterBooleanChoice datasource, contains Label and its Value -->
	<DataSource ID="FilterBooleanChoice">
		<Property ID="Label" Type="String" />
		<Property ID="Value" Type="Boolean" />
	</DataSource>

	<!-- FilterExecuteAction datasource, contains Label and its Action event -->
	<DataSource ID="FilterExecuteAction">
		<Property ID="Label" Type="String" />
		<Property ID="Action" Type="Event" />
	</DataSource>

	<!-- FilterSubMenu datasource, contains Label and its Action event -->
	<DataSource ID="FilterSubMenu">
		<Property ID="Label" Type="String" />
		<Property ID="SubMenuId" Type="Int32" />
	</DataSource>

	<!-- FilterShowInformation datasource, contains Label -->
	<DataSource ID="FilterShowInformation">
		<Property ID="Label" Type="String" />
	</DataSource>

	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
	<!-- Excel Filter Menu data -->
	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
	<!-- This is sample XML data that will get loaded into FilterMenu DataSource.      -->
	<!-- This section of mark up is viewer only. Real code populates FilterMenu        -->
	<!-- in code via auto-generated header file produced from <DataSource> definitions -->
	<!-- http://commandbars/doc/tutorials/Creating%20a%20FlexUI%20Dialog.mht           -->
	<!-- http://commandbars/doc/tutorials/Understanding%20a%20FlexUI%20Dialog.mht      -->
	<FilterMenu>
		<ItemsProp>
			<FilterMenuGroup>
				<Items>
					<FilterExecuteAction>
						<Label>Newest On Top</Label>
					</FilterExecuteAction>
					<FilterExecuteAction>
						<Label>Oldest On Top</Label>
					</FilterExecuteAction>
					<FilterBooleanChoice>
						<Label>Toggle Me</Label>
						<Value>true</Value>
					</FilterBooleanChoice>
				</Items>
			</FilterMenuGroup>

			<FilterMenuGroup>
				<Items>
					<FilterSubMenu>
						<Label>Date Filters</Label>
					</FilterSubMenu>
					<FilterSubMenu>
						<Label>Find by Formatting</Label>
					</FilterSubMenu>
				</Items>
			</FilterMenuGroup>
		</ItemsProp>

		<NumSelected>100/100 Selected</NumSelected>

		<FilterList>
			<Name>Filters</Name>
			<FilterGroups>
				<FilterItem>
					<Name>Show All</Name>
					<Value>true</Value>
				</FilterItem>

				<FilterGroup>
					<Name>2004</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 2004</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 2004</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>2003 (Deep)</Name>
					<Value>true</Value>
					<FilterItems>
						<FilterItem>
							<Name>January-June 2003</Name>
							<Value>true</Value>
							<FilterDays>
								<FilterDay>
									<Name>Day 1</Name>
									<Value>true</Value>
									<FilterHours>
										<FilterHour>
											<Name>Hour 14</Name>
											<Value>true</Value>
											<FilterMinutes>
												<FilterMinute>
													<Name>Minute 1</Name>
													<Value>true</Value>
													<FilterSeconds>
														<FilterSecond>
															<Name>Second 1</Name>
															<Value>true</Value>
														</FilterSecond>
													</FilterSeconds>
												</FilterMinute>
											</FilterMinutes>
										</FilterHour>
									</FilterHours>
								</FilterDay>

								<FilterDay>
									<Name>Day 2</Name>
									<Value>true</Value>
									<FilterHours>
										<FilterHour>
											<Name>Hour 14</Name>
											<Value>true</Value>
											<FilterMinutes>
												<FilterMinute>
													<Name>Minute 1</Name>
													<Value>true</Value>
												</FilterMinute>
											</FilterMinutes>
										</FilterHour>
									</FilterHours>
								</FilterDay>
							</FilterDays>
							
						</FilterItem>

						<FilterItem>
							<Name>July-December 2003</Name>
							<Value>true</Value>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>2002</Name>
					<Value>true</Value>
					<FilterItems>
						<FilterItem>
							<Name>January-June 2002</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 2002</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>2001</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 2001</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 2001</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>2000</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 2000</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 2000</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1999</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1999</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1999</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1998</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1998</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1998</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1997</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1997</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1997</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1996</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1996</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1996</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1995</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1995</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1995</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1994</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1994</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1994</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1993</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1993</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1993</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1992</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1992</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1992</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1991</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1991</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1991</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1990</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1990</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1990</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1989</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1989</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1989</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>

				<FilterGroup>
					<Name>1988</Name>
					<FilterItems>
						<FilterItem>
							<Name>January-June 1988</Name>
						</FilterItem>
						<FilterItem>
							<Name>July-December 1988</Name>
						</FilterItem>
					</FilterItems>
				</FilterGroup>
			</FilterGroups>
		</FilterList>
	</FilterMenu>

</FlexUI>
