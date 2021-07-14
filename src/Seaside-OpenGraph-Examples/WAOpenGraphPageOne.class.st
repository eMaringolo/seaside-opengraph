Class {
	#name : #WAOpenGraphPageOne,
	#superclass : #WAComponent,
	#category : #'Seaside-OpenGraph-Examples'
}

{ #category : #'tools registry' }
WAOpenGraphPageOne class >> register [
	<script>
	
	WAAdmin register: self asApplicationAt: '/opengraph'
]

{ #category : #rendering }
WAOpenGraphPageOne >> renderContentOn: html [

	html heading: 'I am a title'.
	html paragraph: 'With a subtitle'
]

{ #category : #rendering }
WAOpenGraphPageOne >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot .
	(WAOpenGraphDescriptor new) 
		title: 'Foo';
		image: 'http://foo.baz/image.png';
		url: 'http://foo.baz/path/';
		type: 'article';
		updateRoot: anHtmlRoot.
	
	
]
