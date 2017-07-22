<FlexUI>

	<DataSource ID="FlexTest">

		<!-- Properties that were in the old CAB -->
		<Property ID="ValidityCheck" Type="Boolean" />
		<Property ID="SomeLength" Type="Length"/>
		<Property ID="DefTest" Type="Boolean"/>
		
		<Property ID="EsMixedValue" Type="String"/>
		<Property ID="BcMixedValue" Type="Boolean"/>
		<Property ID="SsiMixedValue" Type="Int32"/>
		<Property ID="EiMixedValue" Type="Int32"/>
		<Property ID="EsSetIsMixed" Type="Boolean"/>
		<Property ID="BcSetStartsMixed" Type="Boolean"/>
		<Property ID="SsiSetIsMixed" Type="Boolean"/>
		<Property ID="EiSetIsMixed" Type="Boolean"/>

		<Property ID="EiSetAllowAuto" Type="Boolean"/>
		<Property ID="EiAutoValue" Type="Int32"/>
		<Property ID="EdSetAllowAuto" Type="Boolean"/>
		<Property ID="EdAutoValue" Type="Decimal"/>
		<Property ID="EmuSetAllowAuto" Type="Boolean"/>
		<Property ID="EmuAutoValue" Type="Int32"/>
		
		<State>
			<Property Target="DefTest" IsReadOnly="true" Condition="ValidityCheck EQ true" />
			<Property Target="EsMixedValue" IsMixed="true" StartsMixed="true" Condition="EsSetIsMixed EQ true"/>
			<Property Target="BcMixedValue" IsMixed="true" StartsMixed="true" Condition="BcSetStartsMixed EQ true"/>
			<Property Target="SsiMixedValue" IsMixed="true" StartsMixed="true" Condition="SsiSetIsMixed EQ true"/>
			<Property Target="EiMixedValue" IsMixed="true" StartsMixed="true" Condition="EiSetIsMixed EQ true"/>

			<Property Target="EiAutoValue" AllowAuto="true" Condition="EiSetAllowAuto EQ true"/>
			<Property Target="EdAutoValue" AllowAuto="true" Condition="EdSetAllowAuto EQ true"/>
			<Property Target="EmuAutoValue" AllowAuto="true" Condition="EmuSetAllowAuto EQ true"/>
		</State>

	</DataSource>


	<FlexML>

		<GroupedDialogView DataSourceType="FlexTest" ActiveCategoryIndex="1">
			
			<Category Label="IsMixed Test">
				<BooleanChoice Label="Set EnterString IsMixed" Value="*Bind(Property=EsSetIsMixed)"/>
				<EnterString ID="ESMix" Label="I should get set with Mixed" Value="*Bind(Property=EsMixedValue)" MaxLength="10" MixedText="I am very, very, very mixed"/>
				<BooleanChoice Label="Set BooleanChoice StartsMixed" Value="*Bind(Property=BcSetStartsMixed)"/>
				<BooleanChoice Label="I should get set with Mixed" Value="*Bind(Property=BcMixedValue)"/>
				<BooleanChoice Label="Set SelectSingleItem IsMixed" Value="*Bind(Property=SsiSetIsMixed)"/>
				<SelectSingleItem ID="SSIMix" Label="I should get set with Mixed" SelectedIndex="*Bind(Property=SsiMixedValue)">
					<SelectionItem Label="I am an item"/>
					<SelectionItem Label="I am an item too"/>
				</SelectSingleItem>
				<BooleanChoice Label="Set EnterInteger IsMixed" Value="*Bind(Property=EiSetIsMixed)"/>
				<EnterInteger ID="EIMix" Label="I should get set with Mixed" Value="*Bind(Property=EiMixedValue)" Maximum="20"/>
			</Category>

			<Category Label="IsAuto Test">
				<BooleanChoice Label="Set EnterInteger AllowAuto" Value="*Bind(Property=EiSetAllowAuto)" />
				<EnterInteger Label="Should allow auto value" Value="*Bind(Property=EiAutoValue)"/>
				<EnterInteger Label="Should not allow auto value" />

				<BooleanChoice Label="Set EnterDecimal AllowAuto" Value="*Bind(Property=EdSetAllowAuto)" />
				<EnterDecimal Label="Should allow auto value" Value="*Bind(Property=EdAutoValue)"/>
				<EnterDecimal Label="Should not allow auto value" />

				<!-- Can only test this section in lime
				<BooleanChoice Label="Set EnterEmuLength AllowAuto" Value="*Bind(Property=EmuSetAllowAuto)" />
				<EnterEmuLength Label="Should allow auto value" Value="*Bind(Property=EmuAutoValue)"/>
				<EnterEmuLength Label="Should not allow auto value" />
				-->
			</Category>
			
			<Category Label="Validation Test">
				<EnterString ID="ValidatingString" Label="Enter a string" Value="Start Val" ValidationDescription="Enter a string with 5 to 10 characters">
					<EnterString.Validators>
						<StringLengthValidator MinLength="5" MaxLength="10"/>
					</EnterString.Validators>
				</EnterString>
				
				<EnterInteger ID="ValidatingInteger" Label="Enter an integer" Value="6" Minimum="5" Maximum="15" ValidationCondition="Immediate"/>
				<EnterInteger Label="Enter another integer" Value="*Bind(Property=Value; Source=ValidatingInteger; BindType=OneWay)" ValidationCondition="OnFocusLost"
					ValidationDescription="Enter a number between -5 and 25" >
					<EnterInteger.Validators>
						<IntegerRangeValidator Minimum="-5" Maximum="25"/>
					</EnterInteger.Validators>
				</EnterInteger>
				
				<EnterDecimal ID="ValidatingDecimal" Label="Enter a decimal" Value="6" Minimum="5" Maximum="15" ValidationCondition="Immediate" RoundOff="0.25"/>
				<EnterDecimal Label="Enter another decimal" Value="*Bind(Property=Value; Source=ValidatingDecimal; BindType=OneWay)" ValidationCondition="OnFocusLost"
					ValidationDescription="Enter a number between -5.0 and 25.0 rounded to the nearest hundreth" >
					<EnterDecimal.Validators>
						<DecimalRangeValidator Minimum="-5" Maximum="25" RoundOff="0.01"/>
					</EnterDecimal.Validators>
				</EnterDecimal>
				
				<BooleanChoice Label="Validation Test: EnterString" Value="*Bind(Property=IsValid; Source=ValidatingString; BindType=OneWay)"/>
				<BooleanChoice Label="Validation Test: EnterInteger" Value="*Bind(Property=IsValid; Source=ValidatingInteger; BindType=OneWay)"/>
				<BooleanChoice Label="Validation Test: EnterDecimal" Value="*Bind(Property=IsValid; Source=ValidatingDecimal; BindType=OneWay)"/>
			</Category>
			
			<Category Label="All Concepts Test">
				<BooleanChoice Label="I am a &amp;Boolean Choice" Value="true" Description="This is my description"/>
				<ShowInformation Label="I am information" />
				<EnterString Label="Enter a string" Value="hello"/>
				<EnterString Label="I should have multiple lines" Value="do i?" Multiline="2"/>
				<EnterDecimal Label="Enter a decimal (has an image)" Value="1.5" ImageSource=":bitmap() jumpnext.bmp"/>
				<EnterInteger Label="Enter an integer" Value="5"/>
				<!--<EnterLength Label="Enter a length" Value="1 in"/>-->
				<SelectSingleItem Label="&amp;Select one item" SelectedIndex="-1">
					<SelectionItem Label="Item One" Value="*Bind(Property=DefTest)"/>
					<SelectionItem Label="Item Two" Value="*Bind(Property=DefTest)"/>
					<SelectionItem Label="Item Three" Value="*Bind(Property=DefTest)"/>
					<SelectionItem Label="Item Four - Copy" Value="*Bind(Property=DefTest)"/>
				</SelectSingleItem>
				<ExecuteAction Label="Execute Me!"/>
				<ShowProgress Label="This is Progress: " TotalSteps="200" Value="50"/>
				<Link TargetType="WebLink" Label="Web Link"/>
				<Link TargetType="DialogLink" Label="Dialog Link"/>
				<PickColor Label="Color Picker:"/>
			</Category>
			
		</GroupedDialogView>
		
	</FlexML>
	
	
	<FlexTest>
		<SsiSetIsMixed>false</SsiSetIsMixed>
		<EsSetIsMixed>false</EsSetIsMixed>
		<BcMixedValue>false</BcMixedValue>
		<EsMixedValue>Mix Me!</EsMixedValue>

		<EiSetAllowAuto>true</EiSetAllowAuto>
		<EdSetAllowAuto>true</EdSetAllowAuto>
		<EmuSetAllowAuto>true</EmuSetAllowAuto>
	</FlexTest>

</FlexUI>