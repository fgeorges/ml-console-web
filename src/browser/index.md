# Browser

The browser let you browse the content of a database.

Once you have selected a database to browse, you get a form with three options:
browse documents, collections, or triples.

## Documents

The browser exposes the documents as if their URI were paths on a filesystem,
so you can browse in a directory-like way:

![Screenshot of the document browser](../images/browser-docs.png)

When you select a document, you can see alsmot all of the information about it
(including its content, syntax-highlighted):

![Screenshot of the document editor](../images/browser-doc-editor.png)

You can also edit (or add/remove) the following properties:

- content
- collections
- metadata
- document properties
- permissions

The browsing entry points from the database page are:

- browse all "document directories" from the root
- go straight to a "document directory" by its path (must end with `/`)
- go straight to a document by URI

## Collections

You can also browse collections.  Their URIs are exposed in a similar way than
when browsing the documents by URI as if they were in directories.

When you select a collection though, it gives you the list of all the documents
part of that collection.

![Screenshot of the collection browser](../images/browser-colls.png)

The browsing entry points from the database page are:

- browse all "collection directories" from the root
- go straight to a "collection directory" by its path (must end with `/`)
- go straight to a collection by URI

## Triples

You can also browse triples.  Whether they are managed, non-managed, or exposed
directly through TDE templates does not matter.

**TODO**: Blah blah blah...

The browsing entry points from the database page are:

- browse all triples
- go straight to a resource by IRI
- go straight to a resource by CURIE
