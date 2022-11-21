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
                <h2>Noms des auteurs triés en ordre croissant</h2>
                <xsl:for-each select="livres/livre">
                    <xsl:sort select="ListeAuteurs//@nom" data-type="text" order="ascending"/>
                    <xsl:call-template name="livre">
                        <xsl:with-param name="prix" select="prix"/>
                        <xsl:with-param name="titre" select="titre"/>
                    </xsl:call-template>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="livre">
        <xsl:param name="prix"/>
        <xsl:param name="titre"/>
        <p>prix: <span style="color:#00ff00">
                <xsl:value-of select="$prix"/>
            </span>
        </p>
        <p>nom et prenom: <span style="color:#ff8000">
                <xsl:value-of select="ListeAuteurs//@nom"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="ListeAuteurs//@prenom"/>
            </span>
        </p>
        <p>titre: <span style="color:#ff00ff">
                <xsl:value-of select="$titre"/>
            </span>
        </p>
        <br> </br>

    </xsl:template>
</xsl:stylesheet>
