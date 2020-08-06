import org.javacord.api.DiscordApi;
import org.javacord.api.entity.message.embed.EmbedBuilder;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class interaction {

    public static String sendMessage(DiscordApi api, String channelID, String content){
        if(!api.getChannelById(channelID).get().asServerTextChannel().isPresent()) return "404: Channel not found.";
        else api.getChannelById(channelID).get().asServerTextChannel().get().sendMessage(content); return "200: Success";
    }

    // public static String getLatestMessage(DiscordApi api, String channelID) throws ExecutionException, InterruptedException {
    //     if(!api.getChannelById(channelID).get().asServerTextChannel().isPresent()) return "404: Channel not found.";
    //     return api.getChannelById(channelID).get().asServerTextChannel().get().getMessages(0).get().getNewestMessage().get().getContent();   }
//
    // public static String getMessageByID(DiscordApi api, String channelID, String messageID) throws ExecutionException, InterruptedException {
    //     if(!api.getChannelById(channelID).get().asServerTextChannel().isPresent()) return "404: Channel not found.";
    //     return api.getMessageById(messageID, api.getServerTextChannelById(channelID).get()).get().getContent();
    // }
//
    // public static String getMessageByLink(DiscordApi api, String link) throws ExecutionException, InterruptedException {
    //     if(!api.getMessageByLink(link).isPresent()) return "404: Message not found.";
    //     else return api.getMessageByLink(link).get().get().getContent();
    // }

}
