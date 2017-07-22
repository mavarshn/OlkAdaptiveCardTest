<!-- example package -->
<FlexUI>
	
	<!-- the ui goes under a flexml tag -->
	<FlexML>
	
		<DeclareCustomConcept Name="ListViewConcept" Base="SelectSingleItem">
			<DeclareProperty Name="SortOrder" Type="int"/>
			<DeclareProperty Name="SortProperty" Type="string"/>
			<DeclareProperty Name="ColHeader0"   Type="String"/>
			<DeclareProperty Name="ColHeader1"   Type="String"/>
			<DeclareProperty Name="ColHeader2"   Type="String"/>
			<DeclareProperty Name="ColHeader3"   Type="String"/>
		</DeclareCustomConcept>
		
		<!-- this ui is a bit hacked due to a listview like concept not existing -->
		<GroupedDialogView DataSourceType="WorkbookConnections">

			<Style ID="List">
				<ListViewConcept ID="List">
					<Node.StyleTree>
						<listview expandtofillhoriz="true" Children="*Bind(Property=Children)" SortProperty="*Bind(Property=SortProperty)" SortOrder="*Bind(Property=SortOrder)">
							<listheader showcolumnheaders="true">
								<listcolumn text="*Bind(Property=ColHeader0; BindType=OneWay)" SortProperty="Name" arrow="none" />
								<listcolumn text="*Bind(Property=ColHeader1; BindType=OneWay)" SortProperty="Status" arrow="none" />
								<listcolumn text="*Bind(Property=ColHeader2; BindType=OneWay)" SortProperty="Location" arrow="none" />
							</listheader>
						</listview>
					</Node.StyleTree>
				</ListViewConcept>
				<SelectionItem ID="ListItem">
					<Node.StyleTree>
						<listviewitem Children="*Bind(Property=Children)"/>
					</Node.StyleTree>
				</SelectionItem>
				<Category ID="ListContent">
					<Node.StyleTree>
						<ListContent LayoutChildren="horizontal">
							<Label Text="*Bind(Property=Label)"/>
						</ListContent>
					</Node.StyleTree>
				</Category>
				<Category ID="ListContentWithChildren">
					<Node.StyleTree>
						<ListContent LayoutChildren="horizontal">
							<groupBox grouptype="groupheader" iscollapsible="true" IsCollapsed="true" >
								<groupheader text="*Bind(Property=Label)" LineThickness="0" />
								<groupContent Children="*Bind(Property=Children)">
								</groupContent>
							</groupBox>
						</ListContent>
					</Node.StyleTree>
				</Category>
				<ShowInformation>
					<Node.StyleTree>
						<Label Text="*Bind(Property=Label)"/>
					</Node.StyleTree>
				</ShowInformation>
			</Style>

			<Category Label="DataSources">
			</Category>
			<Category Label="Workbook Links">
				<ShowInformation Label="Here are the links you have to other workbooks"/>
				<ListViewConcept ID="List" Sheet="#List" ColHeader0="Name" ColHeader1="Status" ColHeader2="Location">
					<List ID="WorkbookList" Items="*Bind(Property=ConnectedWorkbooks)" 
						SortProperty="*Bind(Property=SortProperty; Source=List)"
						SortOrder="*Bind(Property=SortOrder; Source=List)">
						
						<ItemTemplate ForType="OKWorkbook">
							<SelectionItem ID="ListItem">
								<Category ID="ListContent" Label="*Bind(Property=Name)" />
								<Category ID="ListContent" Label="*Bind(Property=Status)" />
								<Category ID="ListContent" Label="*Bind(Property=Location)" />
							</SelectionItem>
						</ItemTemplate>
						<ItemTemplate ForType="BrokenWorkbook">
							<SelectionItem ID="ListItem">
								<Category ID="ListContentWithChildren" Label="*Bind(Property=Name)">
									<List Items="*Bind(Property=BrokenConnections)">
										<!-- Allow any type of DataSource here.. This is non-optimal but shows that it can be done. -->
										<ItemTemplate ForType="*Any">
											<ShowInformation Label="*Bind(Property=Label)"/>
										</ItemTemplate>
									</List>
								</Category>
								<Category ID="ListContent" Label="*Bind(Property=Status)" />
								<Category ID="ListContent" Label="*Bind(Property=Location)" />
							</SelectionItem>
						</ItemTemplate>
					</List>
				</ListViewConcept>
				<SelectSingleItem Label="Startup Options">
					<SelectionItem Label="Let users choose to display the alert or not"/>
					<SelectionItem Label="Do not display the alert and do not update automatic links"/>
					<SelectionItem Label="Do not display the alert and update automatic links"/>
				</SelectSingleItem>

			</Category>
			<Category Label="OLE and DDE Links">
			</Category>
		</GroupedDialogView>
	</FlexML>

	<!-- here are our definitions of datasources -->
	<DataSource ID="WorkbookConnections">
		<Property ID="ConnectedWorkbooks" Type="List" />
	</DataSource>

	<DataSource ID="OKWorkbook">
		<Property ID="Name" Type="String" />
		<Property ID="Status" Type="String" />
		<Property ID="Location" Type="String" />
	</DataSource>

	<DataSource ID="BrokenWorkbook">
		<Property ID="Name" Type="String" />
		<Property ID="Status" Type="String" />
		<Property ID="Location" Type="String" />
		<Property ID="BrokenConnections" Type="List" />
	</DataSource>

	<DataSource ID="BrokenConnection">
		<Property ID="Label" Type="String" />
	</DataSource>

	<!-- here are our data for the datasources -->
	<WorkbookConnections>
		<ConnectedWorkbooks>
			<OKWorkbook>
				<Name>1999 Stats.xls</Name>
				<Status>OK</Status>
				<Location>3-C:\1999 Stats.xls</Location>
			</OKWorkbook>
			<!-- one broken workbook in the list -->
			<BrokenWorkbook>
				<Name>2000 Stats.xls</Name>
				<Status>Broken</Status>
				<Location>2-C:\2000 Stats.xls</Location>
				<BrokenConnections>
					<BrokenConnection>
						<Label>Sheet1!A3:D10</Label>
					</BrokenConnection>
					<BrokenConnection>
						<Label>Sheet1!A12</Label>
					</BrokenConnection>
					<BrokenConnection>
						<Label>Sheet1!D12</Label>
					</BrokenConnection>
					<BrokenConnection>
						<Label>Sheet1!B1:F25</Label>
					</BrokenConnection>
				</BrokenConnections>
			</BrokenWorkbook>

			<!-- two ok workbooks in the list -->
			<OKWorkbook>
				<Name>2001 Stats.xls</Name>
				<Status>OK</Status>
				<Location>1-C:\2001 Stats.xls</Location>
			</OKWorkbook>
		</ConnectedWorkbooks>
	</WorkbookConnections>

</FlexUI>
