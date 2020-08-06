import org.javacord.api.AccountType;
import org.javacord.api.DiscordApi;
import org.javacord.api.DiscordApiBuilder;
import returnCode.returnCode;

import java.util.concurrent.ExecutionException;

public class moderation {

    public static String banUser(DiscordApi api, String userID, String serverID, String reason) throws ExecutionException, InterruptedException {
        if(!api.getServerById(serverID).isPresent()) return "404: Guild not found.";
        else if((api.getUserById(userID).get().getMutualServers().size() == -1)) return "404: User not found";
        else if(!(api.getServerById(serverID).get().canBanUser(api.getYourself(), api.getUserById(userID).get()))) return "403: Insufficient Permissions";
        else api.getServerById(serverID).get().banUser(api.getUserById(userID).get(), 0, reason); return "200: Success";
    }

    public static String unbanUser(DiscordApi api, String userID, String serverID, String reason) throws ExecutionException, InterruptedException {
        if(!api.getServerById(serverID).isPresent()) return "404: Guild not found.";
        else if((api.getUserById(userID).get().getMutualServers().size() == -1)) return "404: User not found";
        else if(!(api.getServerById(serverID).get().canBanUsers(api.getYourself()))) return "403: Insufficient Permissions";
        else api.getServerById(serverID).get().unbanUser(api.getUserById(userID).get(), reason); return "200: Success";
    }

    public static String kickUser(DiscordApi api, String userID, String serverID, String reason) throws ExecutionException, InterruptedException {
        if(!api.getServerById(serverID).isPresent()) return "404: Guild not found.";
        else if((api.getUserById(userID).get().getMutualServers().size() == -1)) return "404: User not found";
        else if(!(api.getServerById(serverID).get().canKickUser(api.getYourself(), api.getUserById(userID).get()))) return "403: Insufficient Permissions";
        else api.getServerById(serverID).get().kickUser(api.getUserById(userID).get(), reason); return "200: Success";
    }

}
