# (Get-ADComputer (Get-ExchangeServer).name).distinguishedname

Get-WebServicesVirtualDirectory | fl InternalUrl, ExternalURL

# reference https://blog.misjageuskens.nl/2020/01/30/o365-hybrid-wizard-hybrid-agent-fails-to-validate/

$domain = "LOCAL"

Get-ClientAccessServer | %{ Add-AdPermission -identity (Get-ADComputer ($_.name)).distinguishedname -AccessRights ExtendedRight -ExtendedRights "ms-exch-epi-token-serialization" -User "$domain\Exchange Servers" }
Get-ClientAccessServer | %{ Add-AdPermission -identity (Get-ADComputer ($_.name)).distinguishedname -AccessRights ExtendedRight -ExtendedRights "ms-Exch-EPI-Impersonation" -User "$domain\Exchange Servers" }
Get-MailboxServer | %{ Add-AdPermission -identity (Get-ADComputer ($_.name)).distinguishedname -AccessRights ExtendedRight -ExtendedRights "ms-exch-epi-token-serialization" -User "$domain\Exchange Servers" }
Get-MailboxServer | %{ Add-AdPermission -identity (Get-ADComputer ($_.name)).distinguishedname -AccessRights ExtendedRight -ExtendedRights "ms-Exch-EPI-Impersonation" -User "$domain\Exchange Servers" }
