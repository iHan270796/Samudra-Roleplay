---@class BillingServerConfig
---@field LogsEnabled boolean
---@field Webhooks table<string, string>
SVConfig = SVConfig or {}

SVConfig.LogsEnabled = true

SVConfig.Webhooks = {
	createBill = 'https://discord.com/api/webhooks/1386770452617367665/3sukUCapH1hilLWf83LhgU57OH0yi9wwnBstLCyB1NBdbfKvLb32w3dyKQA2mVJJe7ig',
	payBill = 'https://discord.com/api/webhooks/1386770452617367665/3sukUCapH1hilLWf83LhgU57OH0yi9wwnBstLCyB1NBdbfKvLb32w3dyKQA2mVJJe7ig',
	refundBill = 'https://discord.com/api/webhooks/1386770452617367665/3sukUCapH1hilLWf83LhgU57OH0yi9wwnBstLCyB1NBdbfKvLb32w3dyKQA2mVJJe7ig',
	setGradePerm = 'https://discord.com/api/webhooks/1386770452617367665/3sukUCapH1hilLWf83LhgU57OH0yi9wwnBstLCyB1NBdbfKvLb32w3dyKQA2mVJJe7ig'
}


