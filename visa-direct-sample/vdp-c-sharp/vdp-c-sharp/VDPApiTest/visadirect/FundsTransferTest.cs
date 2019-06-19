using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Configuration;

namespace Vdp
{
    [TestClass]
    public class FundsTransferTest
    {
        private string pushFundsRequest;
        private VisaAPIClient visaAPIClient;

        public FundsTransferTest()
        {
            visaAPIClient = new VisaAPIClient();
            string strDate = DateTime.UtcNow.ToString("yyyy-MM-ddThh:mm:ss");
            pushFundsRequest =
            "{"
                    + "\"systemsTraceAuditNumber\":451000,"
                    + "\"retrievalReferenceNumber\":\"330000550000\","
                    + "\"localTransactionDateTime\":\"" + strDate + "\","
                    + "\"acquiringBin\":408999,\"acquirerCountryCode\":\"840\","
                    + "\"senderAccountNumber\":\"4957030420210470\","
                    + "\"senderCountryCode\":\"USA\","
                    + "\"transactionCurrencyCode\":\"USD\","
                    + "\"senderName\":\"John Smith\","
                    + "\"senderAddress\":\"44 Market St.\","
                    + "\"senderCity\":\"San Francisco\","
                    + "\"senderStateCode\":\"CA\","
                    + "\"recipientName\":\"Adam Smith\","
                    + "\"recipientPrimaryAccountNumber\":\"4761100090708271\","
                    + "\"amount\":\"112.00\","
                    + "\"businessApplicationId\":\"AA\","
                    + "\"transactionIdentifier\":381228649430011,"
                    + "\"merchantCategoryCode\":6012,"
                    + "\"sourceOfFundsCode\":\"03\","
                    + "\"cardAcceptor\":{"
                                        + "\"name\":\"John Smith\","
                                        + "\"terminalId\":\"13655392\","
                                        + "\"idCode\":\"VMT200911026070\","
                                        + "\"address\":{"
                                                        + "\"state\":\"CA\","
                                                        + "\"county\":\"081\","
                                                        + "\"country\":\"USA\","
                                                        + "\"zipCode\":\"94105\""
                                            + "}"
                                        + "},"
                    + "\"feeProgramIndicator\":\"123\""
                + "}";
        }

        [TestMethod]
        public void TestPushFundsTransactions()
        {
            string baseUri = "visadirect/";
            string resourcePath = "fundstransfer/v1/pushfundstransactions/";
            string status = visaAPIClient.DoMutualAuthCall(baseUri + resourcePath, "POST", "Push Funds Transaction Test", pushFundsRequest);
            Assert.AreEqual(status, "OK");
        }
    }
}
