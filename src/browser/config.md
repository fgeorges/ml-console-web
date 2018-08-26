# Browser configuration

The browser can be configured by providing values for some config elements,
stored in documents with specific URI.

- [Config documents](#config-documents)
- [Triple prefixes](#triple-prefixes)
- [URI schemes](#uri-schemes)
- [Default rulesets](#default-rulesets)
- [Resolving components](#resolving-components)

## Config documents

The config documents are simple XML documents.  They are stored in specific
locations, as the form to create them explains (at the bottom of the database
browser screen):

![The config doc creation form](../images/create-config-docs.png)

### Location

There are three locations where we can have configuration for a specific
database:

- `http://expath.org/ml/console/config.xml` (on the database it configures)
- `http://expath.org/ml/console/config/{db}.xml`
- `http://expath.org/ml/console/defaults.xml`

Let's say we look at the `Document` database.  The first location the
Console looks at for config is
`http://expath.org/ml/console/config.xml`, on the `Documents` database
itself.

Then it looks at `http://expath.org/ml/console/config/Documents.xml` (with the
name of the database part of the URI), but this time on the ML Console database
itself.  That is, the database attached as the content database on the Console
app server.  The main advantage is that the document does not interfere with
your data, and you don't have to insert it again and again when wiping your dev
database, if this is part of your daily dev process.

Finally, the Console looks at `http://expath.org/ml/console/defaults.xml`, also
on the ML Console own database.  This config in that document is applied to all
databases.  In case you want to share config for all your databases (e.g. triple
prefixes, which are usually quite standard.)

### Format

**TODO**: Blah blah blah...
"Created for you", etc.

    <config xmlns="http://expath.org/ns/ml/console">
       <uri-schemes>
          ...
       </uri-schemes>
       <triple-prefixes>
          ...
       </triple-prefixes>
       <default-rulesets>
          ...
       </default-rulesets>
    </config>

**TODO**: Blah blah blah...

## Triple prefixes

    <triple-prefixes>
       <decl>
          <prefix>foaf</prefix>
          <uri>http://xmlns.com/foaf/0.1/</uri>
       </decl>
       <decl>
          <prefix>prov</prefix>
          <uri>http://www.w3.org/ns/prov#</uri>
       </decl>
    </triple-prefixes>

**TODO**: Blah blah blah...

## URI schemes

    <uri-schemes>
       <scheme sep="/">
          <root>
             <fix>/</fix>
          </root>
          <regex>/.*</regex>
       </scheme>
       <scheme sep="/">
          <root>
             <start>http://</start>
          </root>
          <regex match="1">(http://[^/]+/).*</regex>
       </scheme>
    </uri-schemes>

**TODO**: Blah blah blah...

## Default rulesets

    <default-rulesets>
       <ruleset>domain.rules</ruleset>
       <ruleset>range.rules</ruleset>
    </default-rulesets>

**TODO**: Blah blah blah...

## Resolving components

**TODO**: Blah blah blah...

- Config components are grouped by type (prefixes, schemes and rulesets)
- Each file can contribute to the set of components
- The corresponding components are added to the global list
- First doc on DB, then DB doc on MLC, then defaults, then internal
- The first one matching in the list is used

`@delegate` can be used to control the order when constructing the global list
- `true` (or `after`), which is the default, components in subsequent docs are added after
- `false` (or `never`), other subsequent docs are not considered
- `before`, components in subsequent docs are added before

=> give an example

    <!-- http://expath.org/ml/console/config/Documents.xml -->
    <config xmlns="http://expath.org/ns/ml/console">
       <triple-prefixes delegate="before">
          <decl>
             <prefix>foo</prefix>
             <uri>http://first.org/foo#</uri>
          </decl>
       </triple-prefixes>
    </config>

    <!-- http://expath.org/ml/console/defaults.xml -->
    <config xmlns="http://expath.org/ns/ml/console">
       <triple-prefixes>
          <decl>
             <prefix>foo</prefix>
             <uri>http://second.org/foo#</uri>
          </decl>
          <decl>
             <prefix>bar</prefix>
             <uri>http://second.org/bar#</uri>
          </decl>
       </triple-prefixes>
    </config>

- the first document is taken into account first

By default, the global list of triple prefix declarations would be:

    foo -> http://first.org/foo#
    foo -> http://second.org/foo#
    bar -> http://second.org/bar#

But because it actually delegates **before**, it is rather (see, the first `foo`
in the list is now different):

    foo -> http://second.org/foo#
    bar -> http://second.org/bar#
    foo -> http://first.org/foo#

If `@delegate` was `never`, the list would rather be (there is no `bar` to be
found anymore):

    foo -> http://first.org/foo#
