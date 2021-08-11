Class {
	#name : #WAOpenGraphPageOne,
	#superclass : #WAComponent,
	#category : #'Seaside-OpenGraph-Examples'
}

{ #category : #'tools registry' }
WAOpenGraphPageOne class >> register [
	<script>
	
	WAAdmin register: self asApplicationAt: 'opengraph'
]

{ #category : #accessing }
WAOpenGraphPageOne >> openGraphDescriptor [

	| descriptor |
	descriptor := WAOpenGraphDescriptor new
		              title: 'Sample OpenGraph Seaside page';
		              description:
			              'This is a sample OpenGraph description generated in Seaside.';
		              url: self requestContext request url;
		              type: 'article';
		              yourself.
	descriptor addElement: (WAOpenGraphImage new
			 url: (WAUrl new
					  scheme: 'https';
					  host: (self requestContext request host findTokens: ':') first;
					  addAllToPath: (WAOpenGraphSampleLibrary urlOf: #seasidelogoPng) path;
					  yourself);
			 alt: 'Seaside Logo';
			 width: 500;
			 height: 500).
	^ descriptor
]

{ #category : #rendering }
WAOpenGraphPageOne >> renderContentOn: html [

	html heading: 'I am a title'.
	html paragraph: 'With a subtitle'
]

{ #category : #rendering }
WAOpenGraphPageOne >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	self openGraphDescriptor updateRoot: anHtmlRoot meta: true
]
