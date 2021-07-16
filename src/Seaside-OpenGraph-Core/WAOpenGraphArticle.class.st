"
article - Namespace URI: https://ogp.me/ns/article#

article:published_time - datetime - When the article was first published.
article:modified_time - datetime - When the article was last changed.
article:expiration_time - datetime - When the article is out of date after.
article:author - profile array - Writers of the article.
article:section - string - A high-level section name. E.g. Technology
article:tag - string array - Tag words associated with this article.
"
Class {
	#name : #WAOpenGraphArticle,
	#superclass : #WAOpenGraphType,
	#category : #'Seaside-OpenGraph-Core'
}

{ #category : #extras }
WAOpenGraphArticle >> author: aString [

	self extraAt: 'author' put: aString
	
]

{ #category : #convenience }
WAOpenGraphArticle >> authors: aCollection [

	aCollection do: [ :each | self author: each ]
	
]

{ #category : #extras }
WAOpenGraphArticle >> expirationTime: aDateAndTime [

	self extraAt: 'expiration_time' put: aDateAndTime.
	
]

{ #category : #extras }
WAOpenGraphArticle >> modifiedTime: aDateAndTime [

	self extraAt: 'modified_time' put: aDateAndTime.
	
]

{ #category : #extras }
WAOpenGraphArticle >> publishedTime: aDateAndTime [

	self extraAt: 'published_time' put: aDateAndTime.
	
]

{ #category : #extras }
WAOpenGraphArticle >> section: aString [

	self extraAt: 'section' put: aString
	
]

{ #category : #extras }
WAOpenGraphArticle >> tag: aString [

	self extraAt: 'tag' put: aString
	
]

{ #category : #convenience }
WAOpenGraphArticle >> tags: aCollection [

	aCollection do: [ :each | self tag: each ]
	
]

{ #category : #extras }
WAOpenGraphArticle >> typeName [

	^ 'article'
]
