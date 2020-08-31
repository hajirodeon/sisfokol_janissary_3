
var fMathEditorsInterface = new FMATH.FMathJavascriptInterface();
$.widget("fmath.mathEditor", {

	options : {
		width : 800,
		height : 500,
		defFormula : '<math><mrow><msub><mi>x</mi><mtext>12</mtext></msub><mo>=</mo><mfrac><mrow><mo>-</mo><mi>b</mi><mo>&plusmn;</mo><msqrt><msup><mi>b</mi><mn>2</mn></msup><mo>-</mo><mn>4</mn><mi>a</mi><mi>c</mi></msqrt></mrow><mrow><mn>2</mn><mi>a</mi></mrow></mfrac></mrow></math>',
		imgPath: 'fmath/img',
		imgFontPath: 'fmath/imgFonts',
		basicIdent: "61,62,63,64,65,66,67,68,69,6a,6b,6c,6d,6e,6f,70,71,72,73,74,75,76,77,78,79,7a,3b1,3b2,3b3,3b4,3b5,3b6,3b7,3b8,3b9,3ba,3bb,3bc,3bd,3be,3bf,3c0,3c1,3c2,3c3,3c4,3c5,3c6,3c7,3c8,3c9",
		basicOperators: '2b,2212,2D,d7,B7,2A,F7,2F,3D,2260,2248,3C,3E,2264,2265,28,29,5B,5D,7B,7D,7C,B1,2213,21-25,2030,26-27,2c,2E,3A-3B,3F-40,5C,5E-5F,7E,221E',
		geometryOperators: '2220,2221,2222,221F,B0,2032,2033,22A5,2225,2261,2245,394,2190,2192,2194,23DC,2234',
		algebraOperators: "225C,2254,221D,2264-226B,2308-230B,2218,2211,220F,2202,2146",
		linearAlgebraOp: "B7,D7,2A02,27E8,27E9,1C1,2020,2021,2A",
		arrowOp: "2190-21FF,27F0-27FF,2900-297F,2B00-2B0F,2B3F-2B4C",
		largeOperators: "220F,2210,2211,222B,222C,222D,222E,222F,2230,2231,2232,2233,22C0,22C1,22C2,22C3,2A00,2A01,2A02,2A03,2A04,2A05,2A06,2A07,2A08,2A09,2A0A,2A0B,2A0C,2A0D,2A0E,2A0F,2A10,2A11,2A12,2A13,2A14,2A15,2A16,2A17,2A18,2A19,2A1A,2A1B,2A1C",
		fencedOperators: "2016,2018,2019,201C,201D,2308,2309,230A,230B,2772,2773,27E6,27E7,27E8,27E9,27EA,27EB,27EC,27ED,27EE,27EF,28,29,2980,2983,2984,2985,2986,2987,2988,2989,298A,298B,298C,298D,298E,298F,2990,2991,2992,2993,2994,2995,2996,2997,2998,29FC,29FD,5B,5D,7B,7C,7D",
		letterlikeOp: "2100-2120,2122-213A,213C-2140",
		logicalRelOp: "2200-22FF,2A00-2AFF",
		constantSymboles: "30,31,32,33,34,35,36,37,38,39,2148,3C0,1D486,3B3,3C6,39B,3B2,3BB,3C3,1D647,3A9,3BC,39A,3B8,3C1,3B1,1D641,3A8,3B4,221E"
	},

	_create : function() {
		this.editor = fMathEditorsInterface.buildEditor(this);
	},

	setMathML : function(mathml){
		this.editor.setMathML(mathml);
	},

	getMathML : function(type, prettyFormat){
		return this.editor.getMathML(type, prettyFormat);
	},

	setLatex : function(latex){
		this.editor.setLatex(latex);
	},

	getLatex : function(){
		return this.editor.getLatex();
	},

	getBlobOrUrl : function(returnFunc, type, prettyFormat){
		this.editor.getBlobOrUrl(returnFunc, type, prettyFormat);
	},
	getImage : function(type, encoderOptions ){
		return this.editor.getImage(type, encoderOptions);
	},
	setSaveCallback : function( saveCallbachFunction ){
		return this.editor.setSaveCallback(saveCallbachFunction);
	},
	doResize : function( ){
		return this.editor.resizeEditorCompleted();
	}
});