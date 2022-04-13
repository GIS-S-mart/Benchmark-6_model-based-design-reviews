# Copyright (c) 2002-2020 "Neo4j,"
# Neo4j Sweden AB [http://neo4j.com]
# This file is a commercial add-on to Neo4j Enterprise Edition.


<#
.SYNOPSIS
Retrieves the status for the Neo4j Windows Service

.DESCRIPTION
Retrieves the status for the Neo4j Windows Service

.PARAMETER Neo4jServer
An object representing a valid Neo4j Server object

.EXAMPLE
Get-Neo4jStatus -Neo4jServer $ServerObject

Retrieves the status of the Windows Service for the Neo4j database at $ServerObject

.OUTPUTS
System.Int32
0 = Service is running
3 = Service is not installed or is not running

.NOTES
This function is private to the powershell module

#>
function Get-Neo4jStatus
{
  [CmdletBinding(SupportsShouldProcess = $false,ConfirmImpact = 'Low')]
  param(
    [Parameter(Mandatory = $true,ValueFromPipeline = $true)]
    [pscustomobject]$Neo4jServer
  )

  begin
  {
  }

  process {
    $ServiceName = Get-Neo4jWindowsServiceName -Neo4jServer $Neo4jServer -ErrorAction Stop
    $neoService = $null
    try {
      $neoService = Get-Service -Name $ServiceName -ErrorAction Stop
    }
    catch {
      Write-Host "The Neo4j Windows Service '$ServiceName' is not installed"
      return 3
    }

    if ($neoService.Status -eq 'Running') {
      Write-Host "Neo4j is running"
      return 0
    }
    else {
      Write-Host "Neo4j is not running.  Current status is $($neoService.Status)"
      return 3
    }
  }

  end
  {
  }
}

# SIG # Begin signature block
# MIId2AYJKoZIhvcNAQcCoIIdyTCCHcUCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBkjxYANABTH8zs
# Syyhz8erTFeyT0cCWECk8axel+oC7KCCGEcwggPFMIICraADAgECAgEAMA0GCSqG
# SIb3DQEBCwUAMIGDMQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJpem9uYTETMBEG
# A1UEBxMKU2NvdHRzZGFsZTEaMBgGA1UEChMRR29EYWRkeS5jb20sIEluYy4xMTAv
# BgNVBAMTKEdvIERhZGR5IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IC0gRzIw
# HhcNMDkwOTAxMDAwMDAwWhcNMzcxMjMxMjM1OTU5WjCBgzELMAkGA1UEBhMCVVMx
# EDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNjb3R0c2RhbGUxGjAYBgNVBAoT
# EUdvRGFkZHkuY29tLCBJbmMuMTEwLwYDVQQDEyhHbyBEYWRkeSBSb290IENlcnRp
# ZmljYXRlIEF1dGhvcml0eSAtIEcyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
# CgKCAQEAv3FiCPH6WTT3G8kYo/eASVjpIoMTpsUgQwE7hPHmhUmfJ+r2hBtOoLTb
# cJjHMgGxBT4HTu70+k8vWTAi56sZVmvigAf88xZ1gDlRe+X5NbZ0TqmNghPktj+p
# A4P6or6KFWp/3gvDthkUBcrqw6gElDtGfDIN8wBmIsiNaW02jBEYt9OyHGC0OPoC
# jM7T3UYH3go+6118yHz7sCtTpJJiaVElBWEaRIGMLKlDliPfrDqBmg4pxRyp6V0e
# tp6eMAo5zvGIgPtLXcwy7IViQyU0AlYnAZG0O3AqP26x6JyIAX2f1PnbU21gnb8s
# 51iruF9G/M7EGwM8CetJMVxpRrPgRwIDAQABo0IwQDAPBgNVHRMBAf8EBTADAQH/
# MA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUOpqFBxBnKLbv9r0FQW4gwZTaD94w
# DQYJKoZIhvcNAQELBQADggEBAJnbXXnV+ZdZZwNh8X47BjF1LaEgjk9lh7T3ppy8
# 2Okv0Nta7s90jHO0OELaBXv4AnW4/aWx1672194Ty1MQfopG0Zf6ty4rEauQsCeA
# +eifWuk3n6vk32yzhRedPdkkT3mRNdZfBOuAg6uaAi21EPTYkMcEc0DtciWgqZ/s
# nqtoEplXxo8SOgmkvUT9BhU3wZvkMqPtOOjYZPMsfhT8Auqfzf8HaBfbIpA4LXqN
# 0VTxaeNfM8p6PXsK48p/Xznl4nW6xXYYM84s8C9Mrfex585PqMSbSlQGxX991QgP
# 4hz+fhe4rF721BayQwkMTfana7SZhGXKeoji4kS+XPfqHPUwggTQMIIDuKADAgEC
# AgEHMA0GCSqGSIb3DQEBCwUAMIGDMQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJp
# em9uYTETMBEGA1UEBxMKU2NvdHRzZGFsZTEaMBgGA1UEChMRR29EYWRkeS5jb20s
# IEluYy4xMTAvBgNVBAMTKEdvIERhZGR5IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9y
# aXR5IC0gRzIwHhcNMTEwNTAzMDcwMDAwWhcNMzEwNTAzMDcwMDAwWjCBtDELMAkG
# A1UEBhMCVVMxEDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNjb3R0c2RhbGUx
# GjAYBgNVBAoTEUdvRGFkZHkuY29tLCBJbmMuMS0wKwYDVQQLEyRodHRwOi8vY2Vy
# dHMuZ29kYWRkeS5jb20vcmVwb3NpdG9yeS8xMzAxBgNVBAMTKkdvIERhZGR5IFNl
# Y3VyZSBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgLSBHMjCCASIwDQYJKoZIhvcNAQEB
# BQADggEPADCCAQoCggEBALngyxDUr3a91JNi6zBkuIEIbMME2WIXji//PmXPj85i
# 5jxSHNoWRUtVq3hrY4NikM4PaWyZyBoUi0zMRTPqiNyeo68r/oBhnXlXxM8u9D8w
# PF1H/JoWvMM3lkFRjhFLVPgovtCMvvAwOB7zsCb4Zkdjbd5xJkePOEdT0UYdtOPc
# AOpFrL28cdmqbwDb280wOnlPX0xH+B3vW8LEnWA7sbJDkdikM07qs9YnT60liqXG
# 9NXQpq50BWRXiLVEVdQtKjo++Li96TIKApRkxBY6UPFKrud5M68MIAd/6N8EOcJp
# AmxjUvp3wRvIdIfIuZMYUFQ1S2lOvDvTSS4f3MHSUvsCAwEAAaOCARowggEWMA8G
# A1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRAwr0njsw0
# gzCiM9f7bLPwtCyAzjAfBgNVHSMEGDAWgBQ6moUHEGcotu/2vQVBbiDBlNoP3jA0
# BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmdvZGFkZHku
# Y29tLzA1BgNVHR8ELjAsMCqgKKAmhiRodHRwOi8vY3JsLmdvZGFkZHkuY29tL2dk
# cm9vdC1nMi5jcmwwRgYDVR0gBD8wPTA7BgRVHSAAMDMwMQYIKwYBBQUHAgEWJWh0
# dHBzOi8vY2VydHMuZ29kYWRkeS5jb20vcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQEL
# BQADggEBAAh+bJMQyDi4lqmQS/+hX08E72w+nIgGyVCPpnP3VzEbvrzkL9v4utNb
# 4LTn5nliDgyi12pjczG19ahIpDsILaJdkNe0fCVPEVYwxLZEnXssneVe5u8MYaq/
# 5Cob7oSeuIN9wUPORKcTcA2RH/TIE62DYNnYcqhzJB61rCIOyheJYlhEG6uJJQEA
# D83EG2LbUbTTD1Eqm/S8c/x2zjakzdnYLOqum/UqspDRTXUYij+KQZAjfVtL/qQD
# WJtGssNgYIP4fVBBzsKhkMO77wIv0hVU7kQV2Qqup4oz7bEtdjYm3ATrn/dhHxXc
# h2/uRpYoraEmfQoJpy4Eo428+LwEMAEwggUAMIID6KADAgECAgEHMA0GCSqGSIb3
# DQEBCwUAMIGPMQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJpem9uYTETMBEGA1UE
# BxMKU2NvdHRzZGFsZTElMCMGA1UEChMcU3RhcmZpZWxkIFRlY2hub2xvZ2llcywg
# SW5jLjEyMDAGA1UEAxMpU3RhcmZpZWxkIFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9y
# aXR5IC0gRzIwHhcNMTEwNTAzMDcwMDAwWhcNMzEwNTAzMDcwMDAwWjCBxjELMAkG
# A1UEBhMCVVMxEDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNjb3R0c2RhbGUx
# JTAjBgNVBAoTHFN0YXJmaWVsZCBUZWNobm9sb2dpZXMsIEluYy4xMzAxBgNVBAsT
# Kmh0dHA6Ly9jZXJ0cy5zdGFyZmllbGR0ZWNoLmNvbS9yZXBvc2l0b3J5LzE0MDIG
# A1UEAxMrU3RhcmZpZWxkIFNlY3VyZSBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgLSBH
# MjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOWQZkvs+UZxqSCDvuls
# v0rJSGmBdU5tJPbLFxP4sHFZhHprK4WkNLUW5cvM6UFwLKQu1voyfeGo3pQQrDHB
# wNhq/1knq3bW/At0a7inrj/EVPS0MUTdk1aMpExem4nLJIOb4ld9t9gSH8mFbfTR
# gPFQm4eu1AsQBfsnuihtF+kO1k25OVUG/wokBX4vxh1ybNSLKYxXfdrZ62Ya00+n
# 339SxDDFpckOAsVTv3c4aAYkw2bIN34wHkVxIzX/kNgqnY3nsJJNPH8qCpPczRZG
# ZfdghIt2S5EncxSS4OrujxbqjQ4+dhe/fYmAgERD5y3gQwl12jborduJOvVdEo4j
# BIMCAwEAAaOCASwwggEoMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEG
# MB0GA1UdDgQWBBQlRYFoUCY4PTstLL7Natm2PbNmYzAfBgNVHSMEGDAWgBR8DDIf
# p9kwf8R9aKNiqKHOqwdbJzA6BggrBgEFBQcBAQQuMCwwKgYIKwYBBQUHMAGGHmh0
# dHA6Ly9vY3NwLnN0YXJmaWVsZHRlY2guY29tLzA7BgNVHR8ENDAyMDCgLqAshipo
# dHRwOi8vY3JsLnN0YXJmaWVsZHRlY2guY29tL3Nmcm9vdC1nMi5jcmwwTAYDVR0g
# BEUwQzBBBgRVHSAAMDkwNwYIKwYBBQUHAgEWK2h0dHBzOi8vY2VydHMuc3RhcmZp
# ZWxkdGVjaC5jb20vcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQELBQADggEBAFZlyv7z
# Pwqok4sYx95DaRM0IL5OX3ioa5zbak1B28ET7NwxACJe9wCeDOA0ZTT5sTpOSMgS
# gYhcWz4IU3r3GmTfuFBhzFNRQClLwvSuOl/kyq0mzE5hQ+X9V6Y3cM5DK7CUw5Lp
# 4V+qEEm3aeTg0B9kpCvNH2+g+IQkGM55PamRv1QYE4mZVBENVcUmC3lPWhxu+WPb
# FICkB6v6sqW5iN2R/mU7pKN5volN4dCw9MgXDAqWFHwJt2zhwthV1BigqkFpcCSj
# ue/pWtw+65RK8LfeXw52+vv7aQNFQFDucgykEoaBzRPRTsQ8yk4N0ibxALe0pqLh
# bnqB/TCseh/HWXswggUhMIIECaADAgECAgkAhHYYKGL3whowDQYJKoZIhvcNAQEL
# BQAwgbQxCzAJBgNVBAYTAlVTMRAwDgYDVQQIEwdBcml6b25hMRMwEQYDVQQHEwpT
# Y290dHNkYWxlMRowGAYDVQQKExFHb0RhZGR5LmNvbSwgSW5jLjEtMCsGA1UECxMk
# aHR0cDovL2NlcnRzLmdvZGFkZHkuY29tL3JlcG9zaXRvcnkvMTMwMQYDVQQDEypH
# byBEYWRkeSBTZWN1cmUgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IC0gRzIwHhcNMTcx
# MTA3MTkzNzAzWhcNMjAxMTA3MTkzNzAzWjBiMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKQ2FsaWZvcm5pYTESMBAGA1UEBxMJU2FuIE1hdGVvMRQwEgYDVQQKEwtOZW80
# aiwgSW5jLjEUMBIGA1UEAxMLTmVvNGosIEluYy4wggEiMA0GCSqGSIb3DQEBAQUA
# A4IBDwAwggEKAoIBAQDSoPiG1pU1Lvqo+aZsFTrUwaV1sDWVBtfWzSnDKB3bUJeC
# 7DhekXtt1FORi3PB4YAC/CSMGgwoBHuqgGuRaJbHjRlmYaZZdKVsgvmDwfEvv16j
# zoyUR8TMTTjCemIDAHwArEadkffpsgnFpQ6KG6+gag/39FXyM2rGmFaqSGkqjVRN
# u4zN5GQu8+CUvRuZO2zEuKdA4wv9ZlmWbV3bpCGIN3Zl4p39Fatz3KYNi4g8lFXh
# B8tJfBToRuqxLZpcuyrXG3PeLa6DNoYOJ3j49DJOEw8Wj9cnqvAaI3CNE2klZ7RS
# cE47YUh7rVpl/ykp9ohgZDtvhAA5RYI5KCnc+oXHAgMBAAGjggGFMIIBgTAMBgNV
# HRMBAf8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMA4GA1UdDwEB/wQEAwIHgDA1
# BgNVHR8ELjAsMCqgKKAmhiRodHRwOi8vY3JsLmdvZGFkZHkuY29tL2dkaWcyczUt
# My5jcmwwXQYDVR0gBFYwVDBIBgtghkgBhv1tAQcXAjA5MDcGCCsGAQUFBwIBFito
# dHRwOi8vY2VydGlmaWNhdGVzLmdvZGFkZHkuY29tL3JlcG9zaXRvcnkvMAgGBmeB
# DAEEATB2BggrBgEFBQcBAQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmdv
# ZGFkZHkuY29tLzBABggrBgEFBQcwAoY0aHR0cDovL2NlcnRpZmljYXRlcy5nb2Rh
# ZGR5LmNvbS9yZXBvc2l0b3J5L2dkaWcyLmNydDAfBgNVHSMEGDAWgBRAwr0njsw0
# gzCiM9f7bLPwtCyAzjAdBgNVHQ4EFgQUvj4gytCNJMDPx3lWv0klX6YK41IwDQYJ
# KoZIhvcNAQELBQADggEBABzaEnMJczETlZUdZE36x84eQS2AmumczZzTMbZ4IhJw
# xF8vVz2+Q+0BcR5uwAXa+s167yqIZsxAub3nu8GzYAF7D7wHDC1H1JNkgfnZf1w2
# WWGL6jkbr5RGrLlU2xE8o03iuFglU4QQl9ouXXBLAsLo/q+pMrPs+EO+g3DwXGFt
# jAKzkrMzJD5Ia2kVSC2aAXrffwRqMpbKVxkf0TQadMGLa6dVybYH7qBfDZ+u8P2K
# Y0qQyQYY63WoVk7TIq1VkbmRXtcvm3/plWPUNTPPEy0DfnjndA2UByib6/iqdnSZ
# 7MYit31rmSsRAS3Wil/qqOGlVfYrSm2s64ryPMOacAkwggV9MIIEZaADAgECAgkA
# hft3suFZEZcwDQYJKoZIhvcNAQELBQAwgcYxCzAJBgNVBAYTAlVTMRAwDgYDVQQI
# EwdBcml6b25hMRMwEQYDVQQHEwpTY290dHNkYWxlMSUwIwYDVQQKExxTdGFyZmll
# bGQgVGVjaG5vbG9naWVzLCBJbmMuMTMwMQYDVQQLEypodHRwOi8vY2VydHMuc3Rh
# cmZpZWxkdGVjaC5jb20vcmVwb3NpdG9yeS8xNDAyBgNVBAMTK1N0YXJmaWVsZCBT
# ZWN1cmUgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IC0gRzIwHhcNMTkwOTE3MDcwMDAw
# WhcNMjQwOTE3MDcwMDAwWjCBhzELMAkGA1UEBhMCVVMxEDAOBgNVBAgTB0FyaXpv
# bmExEzARBgNVBAcTClNjb3R0c2RhbGUxJDAiBgNVBAoTG1N0YXJmaWVsZCBUZWNo
# bm9sb2dpZXMsIExMQzErMCkGA1UEAxMiU3RhcmZpZWxkIFRpbWVzdGFtcCBBdXRo
# b3JpdHkgLSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK4xUTO5
# KWat61iuWRSC5ZZmabnSZI6Vtu0PpstcIj28n0OXPfK7z02vmXgEqTuJdMcJb1bN
# z12KeVox7CBtpFpbY4IovD7awY77EBJbrwThtzWk6EYJo5Z1IUzS9we0ZdwXpH5Y
# Xkfwv4eNKhgqbBpgnqs8vq6c7ZTMiAY8oh+F8wRPBnnb3oQe6PerXPpV8/Mi9/Vy
# 1cM0RDzk3nZmyYMT0SR8KeIcOe5qxbOQUCkSsVVfLriPseQDwSgFTXqTPWF4BQ4x
# 3n32IO4ke0d7x/M0PigRnZnGIPDNpEnwXCEUVxcCXxEQajDmhTdmZ7jTNkerqjjP
# 5M3/rE+liUYgTVUCAwEAAaOCAakwggGlMAwGA1UdEwEB/wQCMAAwDgYDVR0PAQH/
# BAQDAgbAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMB0GA1UdDgQWBBRnhH6XGXwC
# XC+V6/gJnDOS0i3ZrDAfBgNVHSMEGDAWgBQlRYFoUCY4PTstLL7Natm2PbNmYzCB
# hAYIKwYBBQUHAQEEeDB2MCoGCCsGAQUFBzABhh5odHRwOi8vb2NzcC5zdGFyZmll
# bGR0ZWNoLmNvbS8wSAYIKwYBBQUHMAKGPGh0dHA6Ly9jcmwuc3RhcmZpZWxkdGVj
# aC5jb20vcmVwb3NpdG9yeS9zZl9pc3N1aW5nX2NhLWcyLmNydDBUBgNVHR8ETTBL
# MEmgR6BFhkNodHRwOi8vY3JsLnN0YXJmaWVsZHRlY2guY29tL3JlcG9zaXRvcnkv
# bWFzdGVyc3RhcmZpZWxkMmlzc3VpbmcuY3JsMFAGA1UdIARJMEcwRQYLYIZIAYb9
# bgEHFwIwNjA0BggrBgEFBQcCARYoaHR0cDovL2NybC5zdGFyZmllbGR0ZWNoLmNv
# bS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEAgYxDPXocopQPzJmnA6Hl
# i348wi3xRL0bDHxwPdPdbLi/C9OZqUBg2IbEdSc9tatchgtjYENct1gGbOpd8QzN
# Wr1QBUrrkbf0ZbnZbqhXjATyDs8qZ6tDwrcLZkj/WJV21FO0G61mWnmnHwpHohhN
# nr7B8gpTtCC/AyO9mBYBx/AKjtqs0eTw4xVmC2Z5XOW5Vn+ftHjvRg7SH/6Uib/N
# ouFlknIrpYDfbQmbEHjJcEJhsn8MSdct1TwGztJhFthCLxYAT9T5xcsc8/PW/rEt
# JiFMVh2uJ0Ymg6vxA2rOsvNbMWFNa6rndTngtBIMiQ3oKvtf7QDXVFHfm2FITCyW
# MDGCBOcwggTjAgEBMIHCMIG0MQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJpem9u
# YTETMBEGA1UEBxMKU2NvdHRzZGFsZTEaMBgGA1UEChMRR29EYWRkeS5jb20sIElu
# Yy4xLTArBgNVBAsTJGh0dHA6Ly9jZXJ0cy5nb2RhZGR5LmNvbS9yZXBvc2l0b3J5
# LzEzMDEGA1UEAxMqR28gRGFkZHkgU2VjdXJlIENlcnRpZmljYXRlIEF1dGhvcml0
# eSAtIEcyAgkAhHYYKGL3whowDQYJYIZIAWUDBAIBBQCggYQwGAYKKwYBBAGCNwIB
# DDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEE
# AYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgFpysBlpum4Ds
# +Cm0lby8Tv7igz7gj5b6LhhBpboSyDQwDQYJKoZIhvcNAQEBBQAEggEAjlb73/nC
# alaDNoBP5k8qFcPKagPJnkcsnjreiFcGUwkl/Q8XjYJO+3lC0E01Vaj9NyZzOjca
# jX6MZSxloHz+OI2vx3Svp/uWxD8CWnFnn3pzJLlEZCH7aF3aiFcdRLV2nbfWD5HC
# aRtQA6uXkwwbfaGhPtGBtz/O1FUmYTez5bKt39yF3KQkYyeg+ugLnOrhiXSzlbIp
# NCsXeVuFZLc8f/YrGWzeGbu/ja4ASqVZ9of9KoviThgi2wic8h62RckkAwwSDxsu
# 0jqB+I3PQcXWSZ4cE0PhxxC0IFVfim3ZwRIn1vCn/8nsWp9+1+yDjhEw8IrTSWj/
# EJezo3lHC3eu7qGCAm4wggJqBgkqhkiG9w0BCQYxggJbMIICVwIBATCB1DCBxjEL
# MAkGA1UEBhMCVVMxEDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNjb3R0c2Rh
# bGUxJTAjBgNVBAoTHFN0YXJmaWVsZCBUZWNobm9sb2dpZXMsIEluYy4xMzAxBgNV
# BAsTKmh0dHA6Ly9jZXJ0cy5zdGFyZmllbGR0ZWNoLmNvbS9yZXBvc2l0b3J5LzE0
# MDIGA1UEAxMrU3RhcmZpZWxkIFNlY3VyZSBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkg
# LSBHMgIJAIX7d7LhWRGXMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
# hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMDA3MDkxMzI2NTZaMCMGCSqGSIb3DQEJ
# BDEWBBTLn3gmjwa3U2H/9v8QIOAm/bXWhDANBgkqhkiG9w0BAQEFAASCAQABbB5I
# 0bnO/vw6QStvUk734m8spJBnbfyX9N0UST/6/FdTZ+wXHDCBi3+ymhHk3U2fr0//
# xZQx9su+zC+wnLzyVsSTfqXUWGUJTrcWEqKbwhtcNo+NKb6Dl/unes5JgAbIg1Qy
# I39OWB6futntxKJvp3h1z47OHIbCjmMJUtoXTrWaKdB8VhI/WAyme5XqmDiourkV
# sO+6xe76FO3Ow2iM92a2Rj7M++cADsYCtEhyabH6cUdez4qQNPAbi6iDVnqtYrnz
# G9sX2Homrf65quHTTkqKXDCma8UosYhSXi0Uvs1uHSTKiZCaNxgIe0KIb3PWTO57
# wKfSVHrQimFB5jqM
# SIG # End signature block
