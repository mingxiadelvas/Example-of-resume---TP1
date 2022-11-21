<?xml version="1.0" encoding="UTF-8"?>
<!-- Devoir de Ming-Xia Delvas, matricule: 20104038 et Calin Popa, matricule: 20158726-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output omit-xml-declaration="no" method="xml"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"
        encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <body>
                <h2>Prix en ordre decroissant des livres</h2>
                <xsl:for-each select="livres/livre">
                    <xsl:sort select="prix" data-type="number" order="descending"/>
                    <xsl:call-template name="auteur">
                        <xsl:with-param name="nom" select="//@nom"/>
                        <xsl:with-param name="prenom" select="//@prenom"/>
                    </xsl:call-template>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="auteur">
        <xsl:param name="nom"/>
        <xsl:param name="prenom"/>
        <p>nom et prenom: <span style="color:#00ff00">
                <xsl:value-of select="$nom"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$prenom"/>
            </span>
        </p>
        <p>informations: <span style="color:#ff8000">
                <xsl:value-of select="ListeAuteurs/."/>
            </span>
        </p>
        <p>livre: <span style="color:#00bfff">
                <xsl:value-of select="titre"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="@langue"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="annee"/>
            </span>
        </p>
        <p>prix: <span style="color:#ff00ff">
                <xsl:value-of select="prix"/>
            </span>
        </p>
        <br> </br>

    </xsl:template>
</xsl:stylesheet>
