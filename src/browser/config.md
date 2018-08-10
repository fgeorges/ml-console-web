# Browser configuration

The browser can be configured by providing values for some config elements,
stored in documents with specific URI.

- [Config documents](#config-documents)
- [Triple prefixes](#triple-prefixes)
- [URI schemes](#uri-schemes)
- [Default rulesets](#default-rulesets)

## Config documents

The config documents are simple XML documents.  They are stored in specific
locations, as the form to create them explains (at the bottom of the database
browser screen):

![The config doc creation form](../images/create-config-docs.png)

There are three locations where we can have configuration for a specific
database.  Let's say we look at the `Document` database.  The first location the
Console looks at for config is `http://expath.org/ml/console/config.xml`, on the
`Documents` itself.

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

### Location

**TODO**: Blah blah blah...

## Triple prefixes

**TODO**: Blah blah blah...

## URI schemes

**TODO**: Blah blah blah...

## Default rulesets

    <default-rulesets>
       <ruleset>domain.rules</ruleset>
       <ruleset>range.rules</ruleset>
    </default-rulesets>

**TODO**: Blah blah blah...
