Function Set-WDTMediaBuilderTile {

  [cmdletbinding()]  
  Param (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Xml] $XamlTemplate)

  Process {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Verbose "************************************[Set-WDTMediaBuilderTile]**************************************"

    Write-Debug "***********************************[Started: $([DateTime]::Now)]***********************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug "********************************************[Process()]*********************************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

    Write-Verbose "[`$XamlNsManager] Read Template Namespaces..."

    $XamlNsManager = (New-MetroNamespaceManager -Xml $XamlTemplate)

    Try {

      Write-Verbose "[`$TileTemplate] Create new Tile Element..."

      Set-MetroTile -XamlTemplate $XamlTemplate -Icon "appbar_tools" -Title "WinPE Builder" -Name "MediaBuilderTile" | Out-Null

    }
    Catch {

      Write-Error "$($_.Exception)"

      Break

    }

    Write-Debug ""
    
    Write-Debug "****************************************************************************************************"

    Write-Debug "**********************************************[End()]***********************************************"

    Write-Debug "***********************************[Finished: $([DateTime]::Now)]**********************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

  }

}

Function MediaBuilderTile_Click {
  
  $XamlTemplate = New-MetroWindow -Height 350 -Width 450

  Set-MetroTabGrid -XamlTemplate $XamlTemplate -Name "MediaBuilderTabControl" | Out-Null
  
  Set-MetroTabItem -XamlTemplate $XamlTemplate -Name "MediaBuilderTabSimple" -Title "Simple" -Content {
  
    
  
  } | Out-Null

  Set-MetroTabItem -XamlTemplate $XamlTemplate -Name "MediaBuilderTabCustomize" -Title "Customize" | Out-Null

  

  $tempXML = "C:\Users\matt\AppData\Local\Temp\PS_WDT\mediabuilder.xml"

  $XamlTemplate.Save($tempXML)

  $MediaBuilderGUI = Import-WpfGUI -Xaml $XamlTemplate

  Import-WpfVariables -Name "MediaBuilder" -Xaml $XamlTemplate -Form $MediaBuilderGUI -MetroShell $MetroShell

  Import-WpfHandlers -Name "MediaBuilder"
  
  $MediaBuilderGUI.ShowDialog() | Out-Null

}