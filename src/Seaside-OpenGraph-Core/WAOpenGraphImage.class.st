"
The og:image property has some optional structured properties:

og:image:url - Identical to og:image.
og:image:secure_url - An alternate url to use if the webpage requires HTTPS.
og:image:type - A MIME type for this image.
og:image:width - The number of pixels wide.
og:image:height - The number of pixels high.
og:image:alt - A description of what is in the image (not a caption). If the page specifies an og:image it should specify og:image:alt.

https://ogp.me/#structured
"
Class {
	#name : #WAOpenGraphImage,
	#superclass : #WAOpenGraphProperty,
	#category : #'Seaside-OpenGraph-Core'
}

{ #category : #extras }
WAOpenGraphImage >> alt: aString [

	self extraAt: 'alt' put: aString
]

{ #category : #extras }
WAOpenGraphImage >> height: anInteger [ 

	self extraAt: 'height' put: anInteger
]

{ #category : #initialization }
WAOpenGraphImage >> propertyName [

	^ 'image'
]

{ #category : #extras }
WAOpenGraphImage >> secureUrl: aString [

	self extraAt: 'secure_url' put: aString
]

{ #category : #initialization }
WAOpenGraphImage >> url: aString [

	content := aString
]

{ #category : #extras }
WAOpenGraphImage >> width: anInteger [

	self extraAt: 'width' put: anInteger
]
