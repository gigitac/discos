import org.javacord.api.AccountType;
import org.javacord.api.DiscordApi;
import org.javacord.api.DiscordApiBuilder;

import java.util.concurrent.ExecutionException;

public class mainClass {
    public static void main(String[] args) {
        DiscordApi api = new DiscordApiBuilder().setToken("Njk4NzM2MzQ4NDAzNTk3Mzcz.XpKK7w.Ep6vakoeinhFhrFC0xrFjEsiBag").login().join();

        api.addMessageCreateListener(apiGateway ->{
            // Moderation

            // Ban Command
            if(apiGateway.getChannel().getIdAsString().equals("740640219145175100")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).login().join();
                try {
                    System.out.println(moderation.banUser(userAPI, parameters[1], parameters[2], parameters[3]));
                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            // Unban Command
            if(apiGateway.getChannel().getIdAsString().equals("740640253005660161")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).login().join();
                try {
                    moderation.unbanUser(userAPI, parameters[1], parameters[2], parameters[3]);
                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            // Kick Command
            if(apiGateway.getChannel().getIdAsString().equals("740640232357101620")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).setAccountType(AccountType.BOT).login().join();
                try {
                    moderation.kickUser(userAPI, parameters[1], parameters[2], parameters[3]);
                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            // Interaction

            // sendMessage
            if(apiGateway.getChannel().getIdAsString().equals("740638364595650563")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).login().join();
                interaction.sendMessage(userAPI, parameters[1], parameters[2]);
            }

            // Utility

            // addRoleToUser
            if(apiGateway.getChannel().getIdAsString().equals("740645398577938585")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).login().join();
                try {
                    utility.addRoleToUser(userAPI, parameters[1], parameters[2], parameters[3]);
                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            // removeRoleFromuser
            if(apiGateway.getChannel().getIdAsString().equals("740645420279267409")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).login().join();
                try {
                    utility.removeRoleFromUser(userAPI, parameters[1], parameters[2], parameters[3]);
                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            // createChannel
            if(apiGateway.getChannel().getIdAsString().equals("740645472410140734")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).login().join();
                utility.createChannel(userAPI, parameters[1], parameters[2]);
            }

            // deleteChannel
            if(apiGateway.getChannel().getIdAsString().equals("740645540747935796")){
                String[] parameters = apiGateway.getMessageContent().split(",");
                DiscordApi userAPI = new DiscordApiBuilder().setToken(parameters[0]).login().join();
                utility.deleteChannel(userAPI, parameters[1], parameters[2]);
            }
        });
    }


}
