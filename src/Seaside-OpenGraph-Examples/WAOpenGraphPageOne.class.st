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

{ #category : #accessing }
WAOpenGraphPageOne >> openGraphDescriptor [

	^ WAOpenGraphDescriptor new
		  title: 'Sample OpenGraph Seaside page';
		  description:
			  'This is a sample OpenGraph description generated in Seaside.';
		  image: (WAUrl new
				   scheme: self requestContext request url scheme;
				   host: self requestContext request host;
				   addAllToPath: (WAWelcomeFiles urlOf: #seasidestarPng) path;
				   yourself);
		  url: self requestContext request url;
		  type: 'article'
]

{ #category : #rendering }
WAOpenGraphPageOne >> renderContentOn: html [

	html heading: 'I am a title'.
	html paragraph: 'With a subtitle'
]

{ #category : #rendering }
WAOpenGraphPageOne >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Sample OpenGraph Seaside page'.
	anHtmlRoot meta
		name: 'description';
		content:
			'This is a sample OpenGraph description generated in Seaside.'.
	self openGraphDescriptor updateRoot: anHtmlRoot
]
