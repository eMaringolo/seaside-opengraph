Class {
	#name : #WAOpenGraphElementTest,
	#superclass : #WAAbstractHtmlElementTest,
	#category : #'Seaside-OpenGraph-Tests'
}

{ #category : #tests }
WAOpenGraphElementTest >> testImage [

	self
		assert: [ :root | 
			WAOpenGraphDescriptor new
				image: 'http://foo.baz/og.jpg';
				updateRoot: root ]
		gives: '<meta property="og:image:url" content="http://foo.baz/og.jpg"/>'
]

{ #category : #tests }
WAOpenGraphElementTest >> testImageDimensions [

	self
		assert: [ :root | 
			WAOpenGraphDescriptor new
				image
					url: 'http://foo.baz/og.jpg';
					width: 500;
					height: 200;
				updateRoot: root ]
		gives: '<meta property="og:image:url" content="http://foo.baz/og.jpg"/><meta property="og:image:width" content="500"/><meta property="og:image:height" content="200"/>'
]

{ #category : #tests }
WAOpenGraphElementTest >> testImageExtras [

	self
		assert: [ :root | 
			WAOpenGraphDescriptor new
				image
					url: 'http://foo.baz/og.jpg';
					secureUrl: 'https://foo.baz/og.jpg';
				updateRoot: root ]
		gives: '<meta property="og:image:url" content="http://foo.baz/og.jpg"/><meta property="og:image:secure_url" content="https://foo.baz/og.jpg"/>'
]

{ #category : #tests }
WAOpenGraphElementTest >> testTitle [

	self
		assert: [ :root | 
			WAOpenGraphDescriptor new
				title: 'OpenGraph';
				updateRoot: root ]
		gives: '<meta property="og:title" content="OpenGraph"/>'
]

{ #category : #tests }
WAOpenGraphElementTest >> testUrl [

	self
		assert: [ :root | 
			WAOpenGraphDescriptor new
				url: 'http://abc.xyz';
				updateRoot: root ]
		gives: '<meta property="og:url" content="http://abc.xyz"/>'
]
