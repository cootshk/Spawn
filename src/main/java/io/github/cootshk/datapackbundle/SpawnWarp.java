package io.github.cootshk.spawnwarp;

import org.bukkit.Bukkit;
import org.bukkit.command.CommandSender;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.plugin.PluginLogger;
import org.bukkit.plugin.java.JavaPlugin;

import java.io.File;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public final class SpawnWarp extends JavaPlugin implements org.bukkit.event.Listener {

    private static final URL link;

    static {
        try {
            link = new URL("https://cdn.modrinth.com/data/g4U3Cv5k/versions/qwvkLeDM/SpawnWarp.zip");
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }
    }
    private void print(String s) {
        PluginLogger logger = new PluginLogger(this);
        logger.info(s);
    }
    private boolean IsEnabled = false;
    @Override
    public void onEnable() {
        // register event listeners
        getServer().getPluginManager().registerEvents(this, this);
        // Plugin startup logic
        print("Enabled DatapackBundle");
        if (!new File("cached_datapacks").exists()) {
            new File("cached_datapacks").mkdir();
        }
        if (!new File("cached_datapacks/SpawnWarp.zip").exists()) {
            //new File("world/datapacks").mkdir();


            // Download the datapack
            try (InputStream in = link.openStream()) {
                Files.copy(in, new File("cached_datapacks/SpawnWarp.zip").toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        // Copy the datapack to the world folder
        try {
            Files.copy(new File("cached_datapacks/SpawnWarp.zip").toPath(), new File("world/datapacks/SpawnWarp.zip").toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        // Enable the datapack
        getServer().dispatchCommand(getServer().getConsoleSender(), "datapack list");
        getServer().dispatchCommand(getServer().getConsoleSender(), "datapack enable \"file/SpawnWarp.zip\"");
        print("Datapack enabled successfully!");

    }
    /*
    public void copyFileFromJar(String filePathInJar, String destinationPath) {
    InputStream is = null;
    OutputStream os = null;
    try {
        is = getClass().getResourceAsStream(filePathInJar);
        os = new FileOutputStream(destinationPath);
        byte[] buffer = new byte[1024];
        int length;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
    } catch (IOException e) {
        e.printStackTrace();
    } finally {
        try {
            if (is != null) is.close();
            if (os != null) os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
    */
    @EventHandler
    public void PlayerJoinEvent(PlayerJoinEvent event) {
        if (IsEnabled) {
            return;
        }
        IsEnabled = true;
        // /datapack enable "file/SpawnWarp.zip"
        //event.getPlayer().sendMessage("/datapack enable \"file/SpawnWarp.zip\"");
        //event.getPlayer().performCommand("/datapack enable \"file/SpawnWarp.zip\"");
        //DataPack datapack = DataPackManager.getDataPack(new NamespacedKey("cootshk", "spawn"));
        boolean success1 = Bukkit.dispatchCommand((CommandSender) event.getPlayer(), "datapack list");
        boolean success2 = Bukkit.dispatchCommand((CommandSender) event.getPlayer(), "datapack enable \"file/SpawnWarp.zip\"");
        if (!(success1 && success2)) {
            throw new RuntimeException("Failed to enable datapack");
        }
        print("Datapack enabled successfully!");
    }

    @Override
    public void onDisable() {
        boolean success = Bukkit.dispatchCommand(Bukkit.getConsoleSender(), "datapack disable \"file/SpawnWarp.zip\"");
        if (!success) {
            throw new RuntimeException("Failed to enable datapack");
        }
        // Plugin shutdown logic
        try {
            Files.delete(new File("world/datapacks/SpawnWarp.zip").toPath());
        } catch (Exception e) {
            e.printStackTrace();
        }
        print("Disabled DatapackBundle");
    }
}
