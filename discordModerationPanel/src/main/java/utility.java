import org.javacord.api.DiscordApi;

import java.util.concurrent.ExecutionException;

public class utility {
    public class deleteMessages{

    }

    public static String addRoleToUser(DiscordApi api, String roleID, String userID, String serverID) throws ExecutionException, InterruptedException {
        if(!api.getRoleById(roleID).isPresent()) return "404: Role not Found";
        if(!api.getServerById(serverID).get().canManageRole(api.getYourself(), api.getRoleById(roleID).get())) return "403: Access not Permitted";
        else api.getServerById(serverID).get().addRoleToUser(api.getUserById(userID).get(), api.getRoleById(roleID).get()); return "200: Success";
    }

    public static String removeRoleFromUser(DiscordApi api, String roleID, String userID, String serverID) throws ExecutionException, InterruptedException {
        if(!api.getRoleById(roleID).isPresent()) return "404: Role not Found";
        if(!api.getServerById(serverID).get().canManageRole(api.getYourself(), api.getRoleById(roleID).get())) return "403: Access not Permitted";
        else api.getServerById(serverID).get().removeRoleFromUser(api.getUserById(userID).get(), api.getRoleById(roleID).get()); return "200: Success";
    }

    public static String createChannel(DiscordApi api, String channelName, String serverID){
        if(!api.getServerById(serverID).isPresent()) return "404: Guild not Found";
        if(!api.getServerById(serverID).get().canYouCreateChannels()) return "403: Insufficient Permissions";
        else api.getServerById(serverID).get().createTextChannelBuilder().setName(channelName).create(); return "200: Success";
    }

    public static String deleteChannel(DiscordApi api, String channelID, String serverID){
        if(!api.getServerById(serverID).isPresent()) return "404: Guild not Found";
        if(!api.getServerById(serverID).get().getChannelById(channelID).get().asServerTextChannel().isPresent()) return "404: Channel not Found";
        if(!api.getServerById(serverID).get().canYouCreateChannels()) return "403: Insufficient Permissions";
        else api.getChannelById(channelID).get().asServerTextChannel().get().delete();   return "200: Success";
    }
}


